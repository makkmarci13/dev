#!/bin/bash

output(){
    echo -e '\e[36m'$1'\e[0m';
}

warn(){
    echo -e '\e[31m'$1'\e[0m';
}

PANEL=v1.2.2
WINGS=v1.2.3
PHPMYADMIN=5.0.4

preflight(){
    output "Dev Pterodactyl Installation Script"
    output "Copyright © 2020 Oreo Cat <oreocatadl@gmail.com>."
    output "Please join my Discord for community support: discord.gg/2muhG62pZB"
    output ""

    output "Please note that this script is meant to be installed on a fresh OS. Installing it on a non-fresh OS may cause problems."
    output "Automatic operating system detection initialized..."
    os_check

    if [ "$EUID" -ne 0 ]; then
        output "Please run as root."
        exit 3
    fi

    output "Automatic architecture detection initialized..."
    MACHINE_TYPE=`uname -m`
    if [ ${MACHINE_TYPE} == 'x86_64' ]; then
        output "64-bit server detected! Good to go."
        output ""
    else
        output "Unsupported architecture detected! Please switch to 64-bit (x86_64)."
        exit 4
    fi

    output "Automatic virtualization detection initialized..."
        apt-get update --fix-missing
        apt-get -y install software-properties-common
        add-apt-repository -y universe
        apt-get -y install virt-what curl
    virt_serv=$(echo $(virt-what))
    if [ "$virt_serv" = "" ]; then
        output "Virtualization: Bare Metal detected."
    elif [ "$virt_serv" = "openvz lxc" ]; then
        output "Virtualization: OpenVZ 7 detected."
    elif [ "$virt_serv" = "xen xen-hvm" ]; then
        output "Virtualization: Xen-HVM detected."
    elif [ "$virt_serv" = "xen xen-hvm aws" ]; then
        output "Virtualization: Xen-HVM on AWS detected."
        warn "When creating allocations for this node, please use the internal IP as Google Cloud uses NAT routing."
        warn "Resuming in 10 seconds..."
        sleep 10
    else
        output "Virtualization: $virt_serv detected."
    fi
    output ""
    if [ "$virt_serv" != "" ] && [ "$virt_serv" != "kvm" ] && [ "$virt_serv" != "vmware" ] && [ "$virt_serv" != "hyperv" ] && [ "$virt_serv" != "openvz lxc" ] && [ "$virt_serv" != "xen xen-hvm" ] && [ "$virt_serv" != "xen xen-hvm aws" ]; then
        warn "Unsupported type of virtualization detected. Please consult with your hosting provider whether your server can run Docker or not. Proceed at your own risk."
        warn "No support would be given if your server breaks at any point in the future."
        warn "Proceed?\n[1] Yes.\n[2] No."
        read choice
        case $choice in 
            1)  output "Proceeding..."
                ;;
            2)  output "Cancelling installation..."
                exit 5
                ;;
        esac
        output ""
    fi

    output "Kernel detection initialized..."
    if echo $(uname -r) | grep -q xxxx; then
        output "OVH kernel detected. This script will not work. Please reinstall your server using a generic/distribution kernel."
        output "When you are reinstalling your server, click on 'custom installation' and click on 'use distribution' kernel after that."
        output "You might also want to do custom partitioning, remove the /home partition and give / all the remaining space."
        output "Please do not hesitate to contact us if you need help regarding this issue."
        exit 6
    elif echo $(uname -r) | grep -q pve; then
        output "Proxmox LXE kernel detected. You have chosen to continue in the last step, therefore we are proceeding at your own risk."
        output "Proceeding with a risky operation..."
    elif echo $(uname -r) | grep -q stab; then
        if echo $(uname -r) | grep -q 2.6; then 
            output "OpenVZ 6 detected. This server will definitely not work with Docker, regardless of what your provider might say. Exiting to avoid further damages."
            exit 6
        fi
    elif echo $(uname -r) | grep -q gcp; then
        output "Google Cloud Platform detected."
        warn "Please make sure you have a static IP setup, otherwise the system will not work after a reboot."
        warn "Please also make sure the GCP firewall allows the ports needed for the server to function normally."
        warn "When creating allocations for this node, please use the internal IP as Google Cloud uses NAT routing."
        warn "Resuming in 10 seconds..."
        sleep 10
    else
        output "Did not detect any bad kernel. Moving forward..."
        output ""
    fi
}

os_check(){
    if [ -r /etc/os-release ]; then
        lsb_dist="$(. /etc/os-release && echo "$ID")"
        dist_version="$(. /etc/os-release && echo "$VERSION_ID")"
        if [ $lsb_dist = "rhel" ]; then
            dist_version="$(echo $dist_version | awk -F. '{print $1}')"
        fi
    else
        exit 1
    fi
    
    if [ "$lsb_dist" =  "ubuntu" ]; then
        if  [ "$dist_version" != "20.04" ] && [ "$dist_version" != "18.04" ]; then
            output "Unsupported Ubuntu version. Only Ubuntu 20.04 and 18.04 are supported."
            exit 2
        fi
    elif [ "$lsb_dist" = "debian" ]; then
        if [ "$dist_version" != "10" ]; then
            output "Unsupported Debian version. Only Debian 10 is supported."
            exit 2
        fi
    elif [ "$lsb_dist" = "fedora" ]; then
        if [ "$dist_version" != "33" ] && [ "$dist_version" != "32" ]; then
            output "Unsupported Fedora version. Only Fedora 33 and 32 are supported."
            exit 2
        fi
    elif [ "$lsb_dist" = "centos" ]; then
        if [ "$dist_version" != "8" ]; then
            output "Unsupported CentOS version. Only CentOS Stream and 8 are supported."
            exit 2
        fi
    elif [ "$lsb_dist" = "rhel" ]; then
        if  [ $dist_version != "8" ]; then
            output "Unsupported RHEL version. Only RHEL 8 is supported."
            exit 2
        fi
    elif [ "$lsb_dist" != "ubuntu" ] && [ "$lsb_dist" != "debian" ] && [ "$lsb_dist" != "centos" ]; then
        output "Unsupported operating system."
        output ""
        output "Supported OS:"
        output "Ubuntu: 20.04, 18.04"
        output "Debian: 10"
        output "Fedora: 33, 32"
        output "CentOS: 8, 7"
        output "RHEL: 8"
        exit 2
    fi
}

install_options(){
    output "Please select your installation option:"
    output "[1] Install the panel ${PANEL}."
    output "[2] Install the wings ${WINGS}."
    output "[3] Install the panel ${PANEL} and wings ${WINGS}."
    output "[18] Install or update to phpMyAdmin (${PHPMYADMIN}) (only use this after you have installed the panel)."
    output "[19] Emergency MariaDB root password reset."
    output "[20] Emergency database host information reset."
    read choice
    case $choice in
        1 ) installoption=1
            output "You have selected Dev ${PANEL} panel installation only."
            ;;
        2 ) installoption=3
            output "You have selected Dev wings ${WINGS} installation only."
            ;;
        3 ) installoption=5
            output "You have selected Dev Panel & Wings"
            ;;
        18 ) installoption=18
            output "You have selected to install or update phpMyAdmin ${PHPMYADMIN}."
            ;;
        19 ) installoption=19
            output "You have selected MariaDB root password reset."
            ;;
        20 ) installoption=20
            output "You have selected Database Host information reset."
            ;;
        * ) output "You did not enter a valid selection."
            install_options
    esac
}

webserver_options() {
    output "Please select which web server you would like to use:\n[1] Nginx (recommended).\n[2] Apache2/httpd."
    read choice
    case $choice in
        1 ) webserver=1
            output "You have selected Nginx."
            output ""
            ;;
        2 ) webserver=2
            output "You have selected Apache2/httpd."
            output ""
            ;;
        * ) output "You did not enter a valid selection."
            webserver_options
    esac
}

required_infos() {
    output "Please enter the desired user email address:"
    read email
    dns_check
}

dns_check(){
    output "Please enter your FQDN (panel.domain.tld):"
    read FQDN

    output "Resolving DNS..."
    SERVER_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
    DOMAIN_RECORD=$(dig +short ${FQDN})
    if [ "${SERVER_IP}" != "${DOMAIN_RECORD}" ]; then
        output ""
        output "The entered domain does not resolve to the primary public IP of this server."
        output "Please make an A record pointing to your server's IP. For example, if you make an A record called 'panel' pointing to your server's IP, your FQDN is panel.domain.tld"
        output "If you are using Cloudflare, please disable the orange cloud."
        output "If you do not have a domain, you can get a free one at https://freenom.com"
        dns_check
    else
        output "Domain resolved correctly. Good to go..."
    fi
}

install_dependencies(){
    output "Configuring your repositories..."
	    apt-get -y install sudo
        apt-get -y install software-properties-common curl apt-transport-https ca-certificates gnupg
		apt-get -y install autoconf automake g++ libtool build-essential
        dpkg --remove-architecture i386
        echo 'Acquire::ForceIPv4 "true";' | sudo tee /etc/apt/apt.conf.d/99force-ipv4
        apt-get -y update
	    curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
		curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
		apt-get -y install nodejs
		curl -sSL https://get.docker.com/ | CHANNEL=stable bash
        LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
        add-apt-repository -y ppa:chris-lea/redis-server
		apt-add-repository -y universe
		add-apt-repository -y ppa:certbot/certbot
        add-apt-repository -y ppa:nginx/development
        apt -y install tuned dnsutils
		tuned-adm profile latency-performance
        apt-get -y install iptables
        apt-get -y install fail2ban
        apt-get -y install ufw
        apt-get -y update
        apt-get -y upgrade
        apt-get -y autoremove
        apt-get -y autoclean
        apt-get -y install curl
        apt-get -y install php7.4 php7.4-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} nginx tar unzip git redis-server nginx git wget expect
		systemctl enable redis-server
        service redis-server start
        systemctl enable php7.4-fpm
        service php7.4-fpm start
	    systemctl enable cron
		systemctl enable mariadb
		if [ "$webserver" = "1" ]; then
        systemctl enable nginx
        service nginx start
		elif [ "$webserver" = "2" ]; then
        systemctl enable apache2
        service apache2 start
        fi
		service mysql start
}

install_pterodactyl() {
    output "Creating the databases and setting root password..."
    password=Div3rgent
    adminpassword=Div3rgent
    rootpassword=Div3rgent
    Q0="DROP DATABASE IF EXISTS test;"
    Q1="CREATE DATABASE IF NOT EXISTS dev;"
    Q2="SET old_passwords=0;"
    Q3="GRANT ALL ON dev.* TO 'dev'@'127.0.0.1' IDENTIFIED BY '$password';"
    Q4="GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, INDEX, DROP, EXECUTE, PROCESS, RELOAD, LOCK TABLES, CREATE USER ON *.* TO 'admin'@'$SERVER_IP' IDENTIFIED BY '$adminpassword' WITH GRANT OPTION;"
    Q5="SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$rootpassword');"
    Q6="DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
    Q7="DELETE FROM mysql.user WHERE User='';"
    Q8="DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';"
    Q9="FLUSH PRIVILEGES;"
    SQL="${Q0}${Q1}${Q2}${Q3}${Q4}${Q5}${Q6}${Q7}${Q8}${Q9}"
    mysql -u root -e "$SQL"

    output "Binding MariaDB/MySQL to 0.0.0.0."
        if grep -Fqs "bind-address" /etc/mysql/mariadb.conf.d/50-server.cnf ; then
		sed -i -- '/bind-address/s/#//g' /etc/mysql/mariadb.conf.d/50-server.cnf
 		sed -i -- '/bind-address/s/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
		output 'Restarting MySQL process...'
		service mysql restart
	elif grep -Fqs "bind-address" /etc/mysql/my.cnf ; then
        	sed -i -- '/bind-address/s/#//g' /etc/mysql/my.cnf
		sed -i -- '/bind-address/s/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
		output 'Restarting MySQL process...'
		service mysql restart
	elif grep -Fqs "bind-address" /etc/my.cnf ; then
        	sed -i -- '/bind-address/s/#//g' /etc/my.cnf
		sed -i -- '/bind-address/s/127.0.0.1/0.0.0.0/g' /etc/my.cnf
		output 'Restarting MySQL process...'
		service mysql restart
    	elif grep -Fqs "bind-address" /etc/mysql/my.conf.d/mysqld.cnf ; then
        	sed -i -- '/bind-address/s/#//g' /etc/mysql/my.conf.d/mysqld.cnf
		sed -i -- '/bind-address/s/127.0.0.1/0.0.0.0/g' /etc/mysql/my.conf.d/mysqld.cnf
		output 'Restarting MySQL process...'
		service mysql restart
	else
		output 'A MySQL configuration file could not be detected! Please contact support.'
	fi

    output "Downloading Pterodactyl..."
    mkdir -p /var/www/dev
	npm i -g yarn
    cd /var/www
    curl -Lo dev.tar.gz https://github.com/OreoKitten/dev/releases/download/v1.0/dev.tar.gz
    tar -xzvf dev.tar.gz
	cd /var/www/dev
	yarn install
	yarn add @emotion/react
	yarn build:production
    chmod -R 755 storage/* bootstrap/cache/

    output "Installing Pterodactyl..."
    curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
    /usr/local/bin/composer install --no-dev --optimize-autoloader
    php artisan p:environment:setup -n --author=$email --url=https://$FQDN --timezone=America/New_York --cache=file --session=database --queue=database
    php artisan p:environment:database --host=127.0.0.1 --port=3306 --database=dev --username=dev --password=$password
	curl -Lo dev.sql https://github.com/OreoKitten/dev/releases/download/v1.0/dev.sql
    mysql -u root --password=Div3rgent dev < dev.sql
    php artisan p:user:make --email=$email --admin=1
    chown -R www-data:www-data * /var/www/dev

    output "Creating panel queue listeners..."
    (crontab -l ; echo "* * * * * php /var/www/dev/artisan schedule:run >> /dev/null 2>&1")| crontab -
    service cron restart

        cat > /etc/systemd/system/devpteroq.service <<- 'EOF'
[Unit]
Description=Pterodactyl Queue Worker
After=redis-server.service
[Service]
User=www-data
Group=www-data
Restart=always
ExecStart=/usr/bin/php /var/www/dev/artisan queue:work --queue=high,standard,low --sleep=3 --tries=3
[Install]
WantedBy=multi-user.target
EOF
    setsebool -P httpd_can_network_connect 1
	setsebool -P httpd_execmem 1
	setsebool -P httpd_unified 1
    sudo systemctl daemon-reload
    systemctl enable devpteroq.service
    systemctl start devpteroq
}

nginx_config() {
    output "Disabling default configuration..."
    rm -rf /etc/nginx/sites-enabled/default
    output "Configuring Nginx Webserver..."

echo '
server_tokens off;
set_real_ip_from 103.21.244.0/22;
set_real_ip_from 103.22.200.0/22;
set_real_ip_from 103.31.4.0/22;
set_real_ip_from 104.16.0.0/12;
set_real_ip_from 108.162.192.0/18;
set_real_ip_from 131.0.72.0/22;
set_real_ip_from 141.101.64.0/18;
set_real_ip_from 162.158.0.0/15;
set_real_ip_from 172.64.0.0/13;
set_real_ip_from 173.245.48.0/20;
set_real_ip_from 188.114.96.0/20;
set_real_ip_from 190.93.240.0/20;
set_real_ip_from 197.234.240.0/22;
set_real_ip_from 198.41.128.0/17;
set_real_ip_from 2400:cb00::/32;
set_real_ip_from 2606:4700::/32;
set_real_ip_from 2803:f800::/32;
set_real_ip_from 2405:b500::/32;
set_real_ip_from 2405:8100::/32;
set_real_ip_from 2c0f:f248::/32;
set_real_ip_from 2a06:98c0::/29;
real_ip_header X-Forwarded-For;
server {
    listen 80 default_server;
    server_name '"$FQDN"';
    return 301 https://$server_name$request_uri;
}
server {
    listen 443 ssl http2 default_server;
    server_name '"$FQDN"';
    root /var/www/dev/public;
    index index.php;
    access_log /var/log/nginx/dev.app-access.log;
    error_log  /var/log/nginx/dev.app-error.log error;
    # allow larger file uploads and longer script runtimes
    client_max_body_size 100m;
    client_body_timeout 120s;
    sendfile off;
    # SSL Configuration
    ssl_certificate /etc/letsencrypt/live/'"$FQDN"'/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/'"$FQDN"'/privkey.pem;
    ssl_session_cache shared:SSL:10m;
    ssl_protocols TLSv1.2;
    ssl_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256';
    ssl_prefer_server_ciphers on;
    # See https://hstspreload.org/ before uncommenting the line below.
    # add_header Strict-Transport-Security "max-age=15768000; preload;";
    add_header X-Content-Type-Options nosniff;
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Robots-Tag none;
    add_header Content-Security-Policy "frame-ancestors 'self'";
    add_header X-Frame-Options DENY;
    add_header Referrer-Policy same-origin;
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }
    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param PHP_VALUE "upload_max_filesize = 100M \n post_max_size=100M";
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param HTTP_PROXY "";
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
        include /etc/nginx/fastcgi_params;
    }
	location = /arc-sw.js {
        proxy_pass https://arc.io/arc-sw.js;
    }
    location ~ /\.ht {
        deny all;
    }
}
' | sudo -E tee /etc/nginx/sites-available/dev.conf >/dev/null 2>&1
    ln -s /etc/nginx/sites-available/dev.conf /etc/nginx/sites-enabled/dev.conf
    service nginx restart
}

apache_config() {
    output "Disabling default configuration..."
    rm -rf /etc/nginx/sites-enabled/default
    output "Configuring Apache2 web server..."
echo '
<VirtualHost *:80>
  ServerName '"$FQDN"'
  RewriteEngine On
  RewriteCond %{HTTPS} !=on
  RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R,L]
</VirtualHost>
<VirtualHost *:443>
  ServerName '"$FQDN"'
  DocumentRoot "/var/www/dev/public"
  AllowEncodedSlashes On
  php_value upload_max_filesize 100M
  php_value post_max_size 100M
  <Directory "/var/www/dev/public">
    AllowOverride all
  </Directory>
  SSLEngine on
  SSLCertificateFile /etc/letsencrypt/live/'"$FQDN"'/fullchain.pem
  SSLCertificateKeyFile /etc/letsencrypt/live/'"$FQDN"'/privkey.pem
</VirtualHost>
' | sudo -E tee /etc/apache2/sites-available/dev.conf >/dev/null 2>&1

    ln -s /etc/apache2/sites-available/dev.conf /etc/apache2/sites-enabled/dev.conf
    a2enmod ssl
    a2enmod rewrite
    service apache2 restart
}

php_config(){
    output "Configuring PHP socket..."
    bash -c 'cat > /etc/php-fpm.d/www-dev.conf' <<-'EOF'
[pterodactyl]
user = nginx
group = nginx
listen = /var/run/php-fpm/dev.sock
listen.owner = nginx
listen.group = nginx
listen.mode = 0750
pm = ondemand
pm.max_children = 9
pm.process_idle_timeout = 10s
pm.max_requests = 200
EOF
    systemctl restart php-fpm
}

webserver_config(){
        if [ "$installoption" = "1" ]; then
                nginx_config
        elif [ "$installoption" = "2" ]; then
                nginx_config
        elif [ "$installoption" = "3" ]; then
                nginx_config
        fi
}

setup_pterodactyl(){
    install_pterodactyl
    ssl_certs
    webserver_config
}

install_wings() {
    output "Binding MariaDB/MySQL to 0.0.0.0."
        if grep -Fqs "bind-address" /etc/mysql/mariadb.conf.d/50-server.cnf ; then
		sed -i -- '/bind-address/s/#//g' /etc/mysql/mariadb.conf.d/50-server.cnf
 		sed -i -- '/bind-address/s/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
		output 'Restarting MySQL process...'
		service mysql restart
	elif grep -Fqs "bind-address" /etc/mysql/my.cnf ; then
        	sed -i -- '/bind-address/s/#//g' /etc/mysql/my.cnf
		sed -i -- '/bind-address/s/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
		output 'Restarting MySQL process...'
		service mysql restart
	elif grep -Fqs "bind-address" /etc/my.cnf ; then
        	sed -i -- '/bind-address/s/#//g' /etc/my.cnf
		sed -i -- '/bind-address/s/127.0.0.1/0.0.0.0/g' /etc/my.cnf
		output 'Restarting MySQL process...'
		service mysql restart
    	elif grep -Fqs "bind-address" /etc/mysql/my.conf.d/mysqld.cnf ; then
        	sed -i -- '/bind-address/s/#//g' /etc/mysql/my.conf.d/mysqld.cnf
		sed -i -- '/bind-address/s/127.0.0.1/0.0.0.0/g' /etc/mysql/my.conf.d/mysqld.cnf
		output 'Restarting MySQL process...'
		service mysql restart
	else
		output 'A MySQL configuration file could not be detected! Please contact support.'
	fi
	
    output "Creating the databases and setting root password..."
    password=Div3rgent
    adminpassword=Div3rgent
    rootpassword=Div3rgent
    Q0="DROP DATABASE IF EXISTS test;"
    Q1="SET old_passwords=0;"
    Q2="GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, INDEX, DROP, EXECUTE, PROCESS, RELOAD, LOCK TABLES, CREATE USER ON *.* TO 'admin'@'$SERVER_IP' IDENTIFIED BY '$adminpassword' WITH GRANT OPTION;"
    Q3="SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$rootpassword');"
    Q4="DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
    Q5="DELETE FROM mysql.user WHERE User='';"
    Q6="DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';"
    Q7="FLUSH PRIVILEGES;"
    SQL="${Q0}${Q1}${Q2}${Q3}${Q4}${Q5}${Q6}${Q7}"
    mysql -u root -e "$SQL"

    cd /root
    output "Installing Pterodactyl Wings dependencies..."
        apt-get -y install curl tar unzip

    service docker start
    systemctl enable docker
    output "Enabling SWAP support for Docker."
    sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="[^"]*/& swapaccount=1/' /etc/default/grub
    output "Installing the Pterodactyl wings..."
    mkdir -p /etc/dev
    cd /etc/dev
    curl -L -o /usr/local/bin/dev https://github.com/OreoKitten/dev/releases/download/v1.0/DevWings
    chmod u+x /usr/local/bin/dev
    bash -c 'cat > /etc/systemd/system/dev.service' <<-'EOF'
[Unit]
Description=Pterodactyl Wings Daemon
After=docker.service

[Service]
User=root
WorkingDirectory=/etc/dev
LimitNOFILE=4096
PIDFile=/var/run/dev/daemon.pid
ExecStart=/usr/local/bin/dev
Restart=on-failure
StartLimitInterval=600

[Install]
WantedBy=multi-user.target
EOF

    systemctl enable dev
    broadcast_database
    output "Wings ${WINGS} has now been installed on your system."
	output "Input wings config into config file at /etc/dev/config.yml and then do systemctl start wings"
}

install_phpmyadmin(){
    output "Installing phpMyAdmin..."
    cd /var/www/dev/public
    rm -rf phpmyadmin
    wget https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN}/phpMyAdmin-${PHPMYADMIN}-all-languages.zip
    unzip phpMyAdmin-${PHPMYADMIN}-all-languages.zip
    mv phpMyAdmin-${PHPMYADMIN}-all-languages phpmyadmin
    rm -rf phpMyAdmin-${PHPMYADMIN}-all-languages.zip
    cd /var/www/dev/public/phpmyadmin

    SERVER_IP=$(curl -s http://checkip.amazonaws.com)
    BOWFISH=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 34 | head -n 1`
    bash -c 'cat > /var/www/dev/public/phpmyadmin/config.inc.php' <<EOF
<?php
/* Servers configuration */
\$i = 0;
/* Server: MariaDB [1] */
\$i++;
\$cfg['Servers'][\$i]['verbose'] = 'MariaDB';
\$cfg['Servers'][\$i]['host'] = '${SERVER_IP}';
\$cfg['Servers'][\$i]['port'] = '';
\$cfg['Servers'][\$i]['socket'] = '';
\$cfg['Servers'][\$i]['auth_type'] = 'cookie';
\$cfg['Servers'][\$i]['user'] = 'root';
\$cfg['Servers'][\$i]['password'] = '';
/* End of servers configuration */
\$cfg['blowfish_secret'] = '${BOWFISH}';
\$cfg['DefaultLang'] = 'en';
\$cfg['ServerDefault'] = 1;
\$cfg['UploadDir'] = '';
\$cfg['SaveDir'] = '';
\$cfg['CaptchaLoginPublicKey'] = '6LcJcjwUAAAAAO_Xqjrtj9wWufUpYRnK6BW8lnfn';
\$cfg['CaptchaLoginPrivateKey'] = '6LcJcjwUAAAAALOcDJqAEYKTDhwELCkzUkNDQ0J5'
?>    
EOF
    output "Installation completed."
        chown -R www-data:www-data * /var/www/dev
}

ssl_certs(){
    output "Installing Let's Encrypt and creating an SSL certificate..."
    cd /root
	apt-get -y install certbot
        service nginx stop

    certbot certonly --standalone --email "$email" --agree-tos -d "$FQDN" --non-interactive
    
            service nginx restart
       
        if [ "$installoption" = "1" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service nginx stop" --post-hook "service nginx restart" >> /dev/null 2>&1')| crontab -
        elif [ "$installoption" = "2" ]; then
            (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "ufw allow 80" --pre-hook "service wings stop" --post-hook "ufw deny 80" --post-hook "service dev restart" >> /dev/null 2>&1')| crontab -
        elif [ "$installoption" = "3" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service nginx stop" --pre-hook "service wings stop" --post-hook "service nginx restart" --post-hook "service dev restart" >> /dev/null 2>&1')| crontab -
        fi
}

firewall(){
    curl -sSL https://raw.githubusercontent.com/tommytran732/Anti-DDOS-Iptables/master/iptables-no-prompt.sh | sudo bash
    block_icmp
    javapipe_kernel
    output "Setting up Fail2Ban..."
    systemctl enable fail2ban
    bash -c 'cat > /etc/fail2ban/jail.local' <<-'EOF'
[DEFAULT]
# Ban hosts for ten hours:
bantime = 36000
# Override /etc/fail2ban/jail.d/00-firewalld.conf:
banaction = iptables-multiport
[sshd]
enabled = true
EOF
    service fail2ban restart

    output "Configuring your firewall..."
        ufw allow 22
        if [ "$installoption" = "1" ]; then
            ufw allow 80
            ufw allow 443
            ufw allow 8080
            ufw allow 8443
            ufw allow 2021
			ufw allow 2022
            ufw allow 3306
        elif [ "$installoption" = "2" ]; then
            ufw allow 80
            ufw allow 8080
            ufw allow 8443
            ufw allow 2021
            ufw allow 2022
        elif [ "$installoption" = "3" ]; then
            ufw allow 80
            ufw allow 443
            ufw allow 8080
            ufw allow 8443
            ufw allow 2021
            ufw allow 2022
            ufw allow 3306
        fi
        yes |ufw enable 
}

block_icmp(){
    output "Block ICMP (Ping) Packets?"
    output "You should choose [1] if you are not using a monitoring system and [2] otherwise."
    output "[1] Yes."
    output "[2] No."
    read icmp
    case $icmp in
        1 ) /sbin/iptables -t mangle -A PREROUTING -p icmp -j DROP
            (crontab -l ; echo "@reboot /sbin/iptables -t mangle -A PREROUTING -p icmp -j DROP >> /dev/null 2>&1")| crontab - 
            ;;
        2 ) output "Skipping rule..."
            ;;
        * ) output "You did not enter a valid selection."
            block_icmp
    esac    
}

javapipe_kernel(){
    output "Apply JavaPipe's kernel configurations (https://javapipe.com/blog/iptables-ddos-protection)?"
    output "[1] Yes."
    output "[2] No."
    read javapipe
    case $javapipe in
        1)  sh -c "$(curl -sSL https://raw.githubusercontent.com/tommytran732/Anti-DDOS-Iptables/master/javapipe_kernel.sh)"
            ;;
        2)  output "JavaPipe kernel modifications not applied."
            ;;
        * ) output "You did not enter a valid selection."
            javapipe_kernel
    esac 
}

install_database() {
        apt -y install mariadb-server

    output "Creating the databases and setting root password..."
    password=Div3rgent
    adminpassword=Div3rgent
    rootpassword=Div3rgent
    Q0="DROP DATABASE IF EXISTS test;"
    Q1="CREATE DATABASE IF NOT EXISTS panel;"
    Q2="SET old_passwords=0;"
    Q3="GRANT ALL ON panel.* TO 'pterodactyl'@'127.0.0.1' IDENTIFIED BY '$password';"
    Q4="GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, INDEX, DROP, EXECUTE, PROCESS, RELOAD, LOCK TABLES, CREATE USER ON *.* TO 'admin'@'$SERVER_IP' IDENTIFIED BY '$adminpassword' WITH GRANT OPTION;"
    Q5="SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$rootpassword');"
    Q6="DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
    Q7="DELETE FROM mysql.user WHERE User='';"
    Q8="DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';"
    Q9="FLUSH PRIVILEGES;"
    SQL="${Q0}${Q1}${Q2}${Q3}${Q4}${Q5}${Q6}${Q7}${Q8}${Q9}"
    mysql -u root -e "$SQL"

    output "Binding MariaDB/MySQL to 0.0.0.0."
	if [ -f /etc/mysql/my.cnf ] ; then
        sed -i -- 's/bind-address/# bind-address/g' /etc/mysql/my.cnf
		sed -i '/\[mysqld\]/a bind-address = 0.0.0.0' /etc/mysql/my.cnf
		output 'Restarting MySQL process...'
		service mysql restart
	elif [ -f /etc/my.cnf ] ; then
        sed -i -- 's/bind-address/# bind-address/g' /etc/my.cnf
		sed -i '/\[mysqld\]/a bind-address = 0.0.0.0' /etc/my.cnf
		output 'Restarting MySQL process...'
		service mysql restart
    	elif [ -f /etc/mysql/my.conf.d/mysqld.cnf ] ; then
        sed -i -- 's/bind-address/# bind-address/g' /etc/my.cnf
		sed -i '/\[mysqld\]/a bind-address = 0.0.0.0' /etc/my.cnf
		output 'Restarting MySQL process...'
		service mysql restart
	else 
		output 'File my.cnf was not found! Please contact support.'
	fi

        yes | ufw allow 3306

    broadcast_database
}

database_host_reset(){
    SERVER_IP=$(curl -s http://checkip.amazonaws.com)
    adminpassword=Div3rgent
    Q0="SET old_passwords=0;"
    Q1="SET PASSWORD FOR 'admin'@'$SERVER_IP' = PASSWORD('$adminpassword');"
    Q2="FLUSH PRIVILEGES;"
    SQL="${Q0}${Q1}${Q2}"
    mysql mysql -e "$SQL"
    output "New database host information:"
    output "Host: $SERVER_IP"
    output "Port: 3306"
    output "User: admin"
    output "Password: $adminpassword"
}

broadcast(){
    broadcast_database
    output "###############################################################"
    output "FIREWALL INFORMATION"
    output ""
    output "All unnecessary ports are blocked by default."
    output "Use 'ufw allow <port>' to enable your desired ports."
    output "###############################################################"
    output ""
}

broadcast_database(){
        output "###############################################################"
        output "MARIADB/MySQL INFORMATION"
        output ""
        output "Your MariaDB/MySQL root password is $rootpassword"
        output ""
        output "Create your MariaDB/MySQL host with the following information:"
        output "Host: $SERVER_IP"
        output "Port: 3306"
        output "User: admin"
        output "Password: $adminpassword"
        output "###############################################################"
        output ""
}

#Execution
preflight
install_options
case $installoption in 
        1)   webserver_options
             install_dependencies
             required_infos
             firewall
             setup_pterodactyl
             broadcast
			 broadcast_database
             ;;
        3)   install_dependencies
             required_infos
             firewall
             ssl_certs
             install_wings
             broadcast
	         broadcast_database
             ;;
        5)   webserver_options
             install_dependencies
             required_infos
             firewall
             ssl_certs
             setup_pterodactyl
             install_wings
             broadcast
             ;;
        18)  install_phpmyadmin
             ;;
        19) curl -sSL https://raw.githubusercontent.com/tommytran732/MariaDB-Root-Password-Reset/master/mariadb-104.sh | sudo bash
            ;;
        20) database_host_reset
            ;;
esac