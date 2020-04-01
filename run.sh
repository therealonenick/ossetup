#!/bin/bash

#Update and install some basic items
yum update -y && \
    yum install -y\
    yum-plugin-fastestmirror\
    epel-release\
    open-vm-tools\
    net-tools\
    git\
    policycoreutils\
    setools\
    nodejs\

#Install PM2
npm install pm2


#Elrepo Install
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

echo "Getting Version..."
RHVER=$(rpm -E %{rhel})
if [ $RHVER="8" ]
then
    yum install https://www.elrepo.org/elrepo-release-8.1-1.el8.elrepo.noarch.rpm
elif [ $RHVER="7" ]
then
    yum install https://www.elrepo.org/elrepo-release-7.0-4.el7.elrepo.noarch.rpm
elif [ $RHVER="6" ]
then
    yum install https://www.elrepo.org/elrepo-release-6-9.el6.elrepo.noarch.rpm
else
    echo "No matching versions.  Exiting..."
    exit 1
fi



