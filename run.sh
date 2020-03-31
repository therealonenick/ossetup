#!/bin/bash

yum update -y && \
    yum install -y\
    git\
    open-vm-tools\
    policycoreutils\
    setools\
    nodejs
