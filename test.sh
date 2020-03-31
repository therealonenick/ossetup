#!/bin/bash

yum update -y && \
    yum install -y\
    policycoreutils\
    setools\
    nodejs
