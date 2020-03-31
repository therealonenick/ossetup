#!/bin/bash

yum update -y && \
    yum install -y\
    open-vm-tools\
    git\
    policycoreutils\
    setools\
    nodejs\

npm install pm2
