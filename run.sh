#!/bin/bash

yum update -y && \
    yum install -y\
    open-vm-tools\
    net-tools\
    git\
    policycoreutils\
    setools\
    htop\
    ntop\
    nodejs\

npm install pm2
