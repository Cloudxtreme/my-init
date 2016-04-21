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


if [ "$DIST" == "Ubuntu" ]; then
	apt-get update
	apt-get -y --force-yes install vim
	apt-get -y --force-yes install python-pip
    apt-get -y --force-yes install nginx
	pip install shadowsocks
    apt-get -y --force-yes install nodejs
elif [ "$DIST" == "CentOS" ]; then
    ./configure-iptables
	yum makecache
	yum install -y vim
	yum install -y python-setuptools && easy_install pip
	pip install shadowsocks && chkconfig --level 2345 ssservice on && service ssservice start
    yum install -y php-fpm && systemctl enable php-fpm
    yum install -y php-domxml-php4-php5 # for centos 6.5
    yum install -y php-xml # fore centos 7 
    yum install -y epel-release
    yum install -y nginx && systemctl enable nginx
    yum install -y nodejs
fi

wget -N --no-check-certificate https://raw.githubusercontent.com/91yun/serverspeeder/master/serverspeeder-all.sh && bash serverspeeder-all.sh

cp -f ./.gitconfig ~/.gitconfig
cp -f ./.vimrc ~/.vimrc
cp -f ./ssservice /etc/init.d/
