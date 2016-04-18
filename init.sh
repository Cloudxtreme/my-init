#!/bin/sh


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
	apt-get -y --force-yes install git
	apt-get -y --force-yes install python-pip
	pip install shadowsocks
fi

