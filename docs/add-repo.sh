#!/bin/bash -

apt -y install wget
wget -P /etc/apt/trusted.gpg.d https://uclm-arco.github.io/debian/uclm-arco.asc
