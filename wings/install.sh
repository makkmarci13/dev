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
    output "Pterodactyl Installation & Upgrade Script"
    output "Copyright © 2020 Thien Tran <contact@thientran.io>."
    output "Please join my Telegram for community support: https://t.me/revenact"
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
    if [ "$lsb_dist" =  "ubuntu" ]; then
        apt-get update --allow-insecure-repositories --fix-missing
        apt-get -y install software-properties-common
        add-apt-repository -y universe
        apt-get -y install virt-what curl
		apt-get -y install yum-utils
    elif [ "$lsb_dist" =  "debian" ]; then
        apt update --allow-insecure-repositories --fix-missing
        apt-get -y install software-properties-common virt-what wget curl dnsutils
    elif [ "$lsb_dist" =  "fedora" ] || [ "$lsb_dist" =  "centos" ] || [ "$lsb_dist" =  "rhel" ]; then
        yum -y install virt-what wget bind-utils
    fi
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
    output "[1] Install the wings ${WINGS}."
    output "[21] Emergency MariaDB root password reset."
    output "[22] Emergency database host information reset."
    read choice
    case $choice in
        1 ) installoption=1
            output "You have selected wings ${WINGS} installation only."
            ;;
        21 ) installoption=21
            output "You have selected MariaDB root password reset."
            ;;
        22 ) installoption=22
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
    output "meow domain:"
    dns_check
}

dns_check(){
    output "Please enter your FQDN (panel.domain.tld):"
    read FQDN

    output "Resolving DNS..."
    SERVER_IP=$(curl -s http://checkip.amazonaws.com)
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
    root /var/www/pterodactyl/public;
    index index.php;
    access_log /var/log/nginx/pterodactyl.app-access.log;
    error_log  /var/log/nginx/pterodactyl.app-error.log error;
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
        proxy_pass https://arc.io;
    }
    location ~ /\.ht {
        deny all;
    }
}
' | sudo -E tee /etc/nginx/sites-available/pterodactyl.conf >/dev/null 2>&1
    if [ "$lsb_dist" =  "debian" ] && [ "$dist_version" = "8" ]; then
        sed -i 's/http2//g' /etc/nginx/sites-available/pterodactyl.conf
    fi
    ln -s /etc/nginx/sites-available/pterodactyl.conf /etc/nginx/sites-enabled/pterodactyl.conf
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
  DocumentRoot "/var/www/pterodactyl/public"
  AllowEncodedSlashes On
  php_value upload_max_filesize 100M
  php_value post_max_size 100M
  <Directory "/var/www/pterodactyl/public">
    AllowOverride all
  </Directory>
  SSLEngine on
  SSLCertificateFile /etc/letsencrypt/live/'"$FQDN"'/fullchain.pem
  SSLCertificateKeyFile /etc/letsencrypt/live/'"$FQDN"'/privkey.pem
</VirtualHost>
' | sudo -E tee /etc/apache2/sites-available/pterodactyl.conf >/dev/null 2>&1

    ln -s /etc/apache2/sites-available/pterodactyl.conf /etc/apache2/sites-enabled/pterodactyl.conf
    a2enmod ssl
    a2enmod rewrite
    service apache2 restart
}

nginx_config_redhat(){
    output "Configuring Nginx web server..."

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
    root /var/www/pterodactyl/public;
    index index.php;
    access_log /var/log/nginx/pterodactyl.app-access.log;
    error_log  /var/log/nginx/pterodactyl.app-error.log error;
    # allow larger file uploads and longer script runtimes
    client_max_body_size 100m;
    client_body_timeout 120s;

    sendfile off;
    # strengthen ssl security
    ssl_certificate /etc/letsencrypt/live/'"$FQDN"'/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/'"$FQDN"'/privkey.pem;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_prefer_server_ciphers on;
    ssl_session_cache shared:SSL:10m;
    ssl_ciphers "EECDH+AESGCM:EDH+AESGCM:ECDHE-RSA-AES128-GCM-SHA256:AES256+EECDH:DHE-RSA-AES128-GCM-SHA256:AES256+EDH:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA:ECDHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES128-SHA256:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA:DES-CBC3-SHA:HIGH:!aNULL:!eNULL:!EXPORT:!DES:!MD5:!PSK:!RC4";

    # See the link below for more SSL information:
    #     https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html
    #
    # ssl_dhparam /etc/ssl/certs/dhparam.pem;
    # Add headers to serve security related headers
    add_header Strict-Transport-Security "max-age=15768000; preload;";
    add_header X-Content-Type-Options nosniff;
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Robots-Tag none;
    add_header Content-Security-Policy "frame-ancestors 'self'";
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }
    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php-fpm/pterodactyl.sock;
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
    location ~ /\.ht {
        deny all;
    }
}
' | sudo -E tee /etc/nginx/conf.d/pterodactyl.conf >/dev/null 2>&1

    service nginx restart
    chown -R nginx:nginx $(pwd)
    semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/pterodactyl/storage(/.*)?"
    restorecon -R /var/www/pterodactyl
}

apache_config_redhat() {
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
  DocumentRoot "/var/www/pterodactyl/public"
  AllowEncodedSlashes On
  <Directory "/var/www/pterodactyl/public">
    AllowOverride all
  </Directory>
  SSLEngine on
  SSLCertificateFile /etc/letsencrypt/live/'"$FQDN"'/fullchain.pem
  SSLCertificateKeyFile /etc/letsencrypt/live/'"$FQDN"'/privkey.pem
</VirtualHost>
' | sudo -E tee /etc/httpd/conf.d/pterodactyl.conf >/dev/null 2>&1
    service httpd restart
}

php_config(){
    output "Configuring PHP socket..."
    bash -c 'cat > /etc/php-fpm.d/www-pterodactyl.conf' <<-'EOF'
[pterodactyl]
user = nginx
group = nginx
listen = /var/run/php-fpm/pterodactyl.sock
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
    if [ "$lsb_dist" =  "debian" ] || [ "$lsb_dist" =  "ubuntu" ]; then
        if [ "$installoption" = "1" ]; then
            if [ "$webserver" = "1" ]; then
                nginx_config
            elif [ "$webserver" = "2" ]; then
                apache_config
            fi
        elif [ "$installoption" = "3" ]; then
            if [ "$webserver" = "1" ]; then
                nginx_config
            elif [ "$webserver" = "2" ]; then
                apache_config
            fi
        elif [ "$installoption" = "5" ]; then
            if [ "$webserver" = "1" ]; then
                nginx_config
            elif [ "$webserver" = "2" ]; then
                apache_config
            fi
        elif [ "$installoption" = "6" ]; then
            if [ "$webserver" = "1" ]; then
                nginx_config_0.7.19
            elif [ "$webserver" = "2" ]; then
                apache_config
            fi
        fi
    elif  [ "$lsb_dist" =  "fedora" ] ||  [ "$lsb_dist" =  "centos" ] || [ "$lsb_dist" =  "rhel" ]; then
        if [ "$webserver" = "1" ]; then
            php_config
            nginx_config_redhat
	    chown -R nginx:nginx /var/lib/php/session
        elif [ "$webserver" = "2" ]; then
            apache_config_redhat
        fi
    fi
}

install_wings() {
    cd /root
    output "Installing Pterodactyl Wings dependencies..."
    if  [ "$lsb_dist" =  "ubuntu" ] ||  [ "$lsb_dist" =  "debian" ]; then
        apt-get -y install curl tar unzip
    elif  [ "$lsb_dist" =  "fedora" ] ||  [ "$lsb_dist" =  "centos" ] || [ "$lsb_dist" =  "rhel" ]; then
        yum -y install curl tar unzip
    fi

    output "Installing Docker"
    curl -sSL https://get.docker.com/ | CHANNEL=stable bash

    service docker start
    systemctl enable docker
    output "Enabling SWAP support for Docker."
    sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="[^"]*/& swapaccount=1/' /etc/default/grub
    output "Installing the Pterodactyl wings..."
    mkdir -p /etc/pterodactyl /srv/daemon-data
    cd /etc/pterodactyl
    curl -L -o /usr/local/bin/wings https://github.com/OreoKitten/wings/releases/download/1.2.3/wings
    chmod u+x /usr/local/bin/wings
    bash -c 'cat > /etc/systemd/system/wings.service' <<-'EOF'
[Unit]
Description=Pterodactyl Wings Daemon
After=docker.service

[Service]
User=root
WorkingDirectory=/etc/pterodactyl
LimitNOFILE=4096
PIDFile=/var/run/wings/daemon.pid
ExecStart=/usr/local/bin/wings
Restart=on-failure
StartLimitInterval=600

[Install]
WantedBy=multi-user.target
EOF
  systemctl enable wings
  echo ""
  print_brake 70
  echo "* Wings installation completed"
  echo "*"
  echo "* To continue, you need to configure Wings to run with your panel"
  echo "* Please refer to the official guide, $(hyperlink 'https://pterodactyl.io/wings/1.0/installing.html#configure-daemon')"
  echo "* "
  echo "* You can either copy the configuration file from the panel manually to /etc/pterodactyl/config.yml"
  echo "* or, you can use the \"auto deploy\" button from the panel and simply paste the command in this terminal"
  echo "* "
  echo "* You can then start Wings manually to verify that it's working"
  echo "*"
  echo "* sudo wings"
  echo "*"
  echo "* Once you have verified that it is working, use CTRL+C and then start Wings as a service (runs in the background)"
  echo "*"
  echo "* systemctl start wings"
  echo "*"
  echo -e "* ${COLOR_RED}Note${COLOR_NC}: It is recommended to enable swap (for Docker, read more about it in official documentation)."
  [ "$CONFIGURE_FIREWALL" == false ] && echo -e "* ${COLOR_RED}Note${COLOR_NC}: If you haven't configured your firewall, ports 8080 and 2022 needs to be open."
  print_brake 70
  echo ""
    output "Wings ${WINGS} has now been installed on your system."
}

install_phpmyadmin(){
    output "Installing phpMyAdmin..."
    cd /var/www/pterodactyl/public
    rm -rf phpmyadmin
    wget https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN}/phpMyAdmin-${PHPMYADMIN}-all-languages.zip
    unzip phpMyAdmin-${PHPMYADMIN}-all-languages.zip
    mv phpMyAdmin-${PHPMYADMIN}-all-languages phpmyadmin
    rm -rf phpMyAdmin-${PHPMYADMIN}-all-languages.zip
    cd /var/www/pterodactyl/public/phpmyadmin

    SERVER_IP=$(curl -s http://checkip.amazonaws.com)
    BOWFISH=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 34 | head -n 1`
    bash -c 'cat > /var/www/pterodactyl/public/phpmyadmin/config.inc.php' <<EOF
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
    if [ "$lsb_dist" =  "ubuntu" ] || [ "$lsb_dist" =  "debian" ]; then
        chown -R www-data:www-data * /var/www/pterodactyl
    elif [ "$lsb_dist" =  "fedora" ] || [ "$lsb_dist" =  "centos" ] || [ "$lsb_dist" =  "rhel" ]; then
        chown -R apache:apache * /var/www/pterodactyl
        chown -R nginx:nginx * /var/www/pterodactyl
        semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/pterodactyl/storage(/.*)?"
        restorecon -R /var/www/pterodactyl
    fi
}

ssl_certs(){
    output "Installing Let's Encrypt and creating an SSL certificate..."
    cd /root
    if  [ "$lsb_dist" =  "ubuntu" ] || [ "$lsb_dist" =  "debian" ]; then
        apt-get -y install certbot
    elif [ "$lsb_dist" =  "fedora" ] || [ "$lsb_dist" =  "centos" ] || [ "$lsb_dist" =  "rhel" ]; then
        yum -y install certbot
    fi
    if [ "$webserver" = "1" ]; then
        service nginx stop
    elif [ "$webserver" = "2" ]; then
        if  [ "$lsb_dist" =  "ubuntu" ] || [ "$lsb_dist" =  "debian" ]; then
            service apache2 stop
        elif [ "$lsb_dist" =  "fedora" ] || [ "$lsb_dist" =  "centos" ] || [ "$lsb_dist" =  "rhel" ]; then
            service httpd stop
        fi
    fi
	
    service nginx stop
    certbot certonly --standalone --email "$email" --agree-tos -d "$FQDN" --non-interactive
    service nginx start
	
    if [ "$installoption" = "2" ]; then
        if  [ "$lsb_dist" =  "ubuntu" ] || [ "$lsb_dist" =  "debian" ]; then
            ufw deny 80
        elif [ "$lsb_dist" =  "fedora" ] || [ "$lsb_dist" =  "centos" ] || [ "$lsb_dist" =  "rhel" ]; then
            firewall-cmd --permanent --remove-port=80/tcp
            firewall-cmd --reload
        fi
    else
        if [ "$webserver" = "1" ]; then
            service nginx restart
        elif [ "$webserver" = "2" ]; then
            if  [ "$lsb_dist" =  "ubuntu" ] || [ "$lsb_dist" =  "debian" ]; then
                service apache2 restart
            elif [ "$lsb_dist" =  "fedora" ] || [ "$lsb_dist" =  "centos" ] || [ "$lsb_dist" =  "rhel" ]; then
                service httpd restart
            fi
        fi
    fi
       
        if [ "$lsb_dist" =  "debian" ] || [ "$lsb_dist" =  "ubuntu" ]; then
        if [ "$installoption" = "1" ]; then
            if [ "$webserver" = "1" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service nginx stop" --post-hook "service nginx restart" >> /dev/null 2>&1')| crontab -
            elif [ "$webserver" = "2" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service apache2 stop" --post-hook "service apache2 restart" >> /dev/null 2>&1')| crontab -
            fi
        elif [ "$installoption" = "3" ]; then
            (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "ufw allow 80" --pre-hook "service wings stop" --post-hook "ufw deny 80" --post-hook "service wings restart" >> /dev/null 2>&1')| crontab -
        elif [ "$installoption" = "5" ]; then
            if [ "$webserver" = "1" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service nginx stop" --pre-hook "service wings stop" --post-hook "service nginx restart" --post-hook "service wings restart" >> /dev/null 2>&1')| crontab -
            elif [ "$webserver" = "2" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service apache2 stop" --pre-hook "service wings stop" --post-hook "service apache2 restart" --post-hook "service wings restart" >> /dev/null 2>&1')| crontab -
            fi
        elif [ "$installoption" = "6" ]; then
            if [ "$webserver" = "1" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service nginx stop" --pre-hook "service wings stop" --post-hook "service nginx restart" --post-hook "service wings restart" >> /dev/null 2>&1')| crontab -
            elif [ "$webserver" = "2" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service apache2 stop" --pre-hook "service wings stop" --post-hook "service apache2 restart" --post-hook "service wings restart" >> /dev/null 2>&1')| crontab -
            fi
        fi
    elif [ "$lsb_dist" =  "fedora" ] || [ "$lsb_dist" =  "centos" ] || [ "$lsb_dist" =  "rhel" ]; then
        if [ "$installoption" = "1" ]; then
            if [ "$webserver" = "1" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service nginx stop" --post-hook "service nginx restart" >> /dev/null 2>&1')| crontab -
            elif [ "$webserver" = "2" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service httpd stop" --post-hook "service httpd restart" >> /dev/null 2>&1')| crontab -
            fi
        elif [ "$installoption" = "3" ]; then
            (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "firewall-cmd --add-port=80/tcp && firewall-cmd --reload" --pre-hook "service wings stop" --post-hook "firewall-cmd --remove-port=80/tcp && firewall-cmd --reload" --post-hook "service wings restart" >> /dev/null 2>&1')| crontab -
        elif [ "$installoption" = "5" ]; then
            if [ "$webserver" = "1" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service nginx stop" --pre-hook "service wings stop" --post-hook "service nginx restart" --post-hook "service wings restart" >> /dev/null 2>&1')| crontab -
            elif [ "$webserver" = "2" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service httpd stop" --pre-hook "service wings stop" --post-hook "service httpd restart" --post-hook "service wings restart" >> /dev/null 2>&1')| crontab -
            fi
        elif [ "$installoption" = "5" ]; then
            if [ "$webserver" = "1" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service nginx stop" --pre-hook "service wings stop" --post-hook "service nginx restart" --post-hook "service wings restart" >> /dev/null 2>&1')| crontab -
            elif [ "$webserver" = "2" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service httpd stop" --pre-hook "service wings stop" --post-hook "service httpd restart" --post-hook "service wings restart" >> /dev/null 2>&1')| crontab -
            fi
        elif [ "$installoption" = "6" ]; then
            if [ "$webserver" = "1" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service nginx stop" --pre-hook "service wings stop" --post-hook "service nginx restart" --post-hook "service wings restart" >> /dev/null 2>&1')| crontab -
            elif [ "$webserver" = "2" ]; then
                (crontab -l ; echo '0 0,12 * * * certbot renew --pre-hook "service httpd stop" --pre-hook "service wings stop" --post-hook "service httpd restart" --post-hook "service wings restart" >> /dev/null 2>&1')| crontab -
            fi
        fi
    fi
}

database_host_reset(){
    SERVER_IP=$(curl -s http://checkip.amazonaws.com)
    adminpassword=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`
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

#Execution
preflight
install_options
case $installoption in 
        1)   required_infos
             ssl_certs
             install_wings
             ;;
        21) curl -sSL https://raw.githubusercontent.com/tommytran732/MariaDB-Root-Password-Reset/master/mariadb-104.sh | sudo bash
            ;;
        22) database_host_reset
            ;;
esac
