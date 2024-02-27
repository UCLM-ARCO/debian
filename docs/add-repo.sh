#!/bin/bash -

apt -y install wget
wget -P /etc/apt/trusted.gpg.d https://uclm-arco.github.io/debian/uclm-arco.asc
echo "deb https://uclm-arco.github.io/debian/ sid main" > /etc/apt/sources.list.d/arco.list
apt update
