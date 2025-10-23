#!/bin/bash -

apt -y install wget
wget -O /etc/apt/trusted.gpg.d/uclm-arco.asc https://uclm-arco.github.io/debian/uclm-arco.asc
echo "deb [signed-by=/etc/apt/trusted.gpg.d/uclm-arco.asc] https://uclm-arco.github.io/debian/ sid main" > /etc/apt/sources.list.d/arco.list
apt update
echo "** File '/etc/apt/sources.list.d/arco.list' was created."
