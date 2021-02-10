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
    output "[3] Install the wings ${WINGS}."
    output "[5] Install the panel ${PANEL} and wings ${WINGS}."
    output "[18] Install or update to phpMyAdmin (${PHPMYADMIN}) (only use this after you have installed the panel)."
    output "[21] Emergency MariaDB root password reset."
    output "[22] Emergency database host information reset."
    read choice
    case $choice in
        1 ) installoption=1
            output "You have selected ${PANEL} panel installation only."
            ;;
        3 ) installoption=3
            output "You have selected wings ${WINGS} installation only."
            ;;
        5 ) installoption=5
            output "You have selected ${PANEL} panel and wings ${WINGS} installation."
            ;;
        18 ) installoption=18
            output "You have selected to install or update phpMyAdmin ${PHPMYADMIN}."
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
        LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
        add-apt-repository -y ppa:chris-lea/redis-server
		add-apt-repository -y ppa:certbot/certbot
        add-apt-repository -y ppa:nginx/development
        apt -y install tuned dnsutils
		tuned-adm profile latency-performance
        apt-get -y update
        apt-get -y upgrade
        apt-get -y autoremove
        apt-get -y autoclean
        apt-get -y install curl
        if [ "$webserver" = "1" ]; then
            apt -y install php7.4 php7.4-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} nginx tar unzip git redis-server nginx git wget expect
        elif [ "$webserver" = "2" ]; then
             apt -y install php7.4 php7.4-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} curl tar unzip git redis-server apache2 libapache2-mod-php7.4 redis-server git wget expect
		fi
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


