#!/bin/bash

echo "Getting Version..."
RHVER=$(rpm -E %{rhel})

#Update and install some basic items
echo "Installing Updates and base packages."
yum update -y && \
    yum install -y\
    epel-release\
    open-vm-tools\
    net-tools\
    git\
    policycoreutils\
    setools\
    nodejs\

#Install PM2
echo "Installing PM2."
npm install pm2


#Elrepo Install
echo "Importing ELRepo Key..."
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

echo "Installing ELRepo.."
#ELRepo recommends using yum-plugin-fastestmirror but its not availble with Centos8 as of this writing.
#adding it only to v7 and 6.
if [ $RHVER="8" ]
then
    yum install -y https://www.elrepo.org/elrepo-release-8.1-1.el8.elrepo.noarch.rpm
elif [ $RHVER="7" ]
then
    yum install -y yum-plugin-fastestmirror && https://www.elrepo.org/elrepo-release-7.0-4.el7.elrepo.noarch.rpm
elif [ $RHVER="6" ]
then
    yum install -y yum-plugin-fastestmirror & https://www.elrepo.org/elrepo-release-6-9.el6.elrepo.noarch.rpm
else
    echo "No matching versions.  Exiting..."
    exit 1
fi

#Update and install some additional items
yum update -y && \
    yum install -y\
    htop\
    ntop\

