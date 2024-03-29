#!/bin/bash


DIST=""

if cat /etc/*release | grep 'CentOS' > /dev/null 2>&1
then
	DIST='CentOS'
elif cat /etc/*release | grep 'Ubuntu' > /dev/null 2>&1
then 
	DIST='Ubuntu'
elif cat /etc/*release | grep 'Arch Linux' > /dev/null 2>&1
then
	DIST='Arch Linux'
fi

echo $DIST


cp -f ./.gitconfig ~/.gitconfig
cp -f ./.vimrc ~/.vimrc
cp -f ./ssservice /etc/init.d/


if [ "$DIST" == "Ubuntu" ]; then
	apt-get update
	apt-get -y --force-yes install vim
	apt-get -y --force-yes install python-pip
    apt-get -y --force-yes install nginx
	pip install shadowsocks
    pip install speedtest-cli
    apt-get -y --force-yes install nodejs
elif [ "$DIST" == "CentOS" ]; then
    ./configure-iptables.sh
	yum makecache
	yum install -y vim
	yum install -y python-setuptools && easy_install pip
	pip install shadowsocks && chkconfig --level 2345 ssservice on && service ssservice start
    pip install speedtest-cli
    yum install -y php-fpm && (systemctl enable php-fpm || chkconfig --level 2345 php-fpm on)
    yum install -y php-domxml-php4-php5 || yum install -y php-xml
    yum install -y epel-release
    yum install -y nginx && (systemctl enable nginx || chkconfig --level 2345 nginx on)
    yum install -y nodejs
	(systemctl enable iptables && systemctl start iptables) || (chkconfig --level 2345 iptables on && service iptables start)
fi

wget -N --no-check-certificate https://raw.githubusercontent.com/91yun/serverspeeder/master/serverspeeder-all.sh && bash serverspeeder-all.sh

