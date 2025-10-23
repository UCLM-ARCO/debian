#!/bin/bash -

apt -y install wget
wget -P /etc/apt/trusted.gpg.d https://uclm-arco.github.io/debian/uclm-arco.asc

cat > /etc/apt/sources.list.d/arco.sources <<'EOF'
Types: deb
URIs: https://uclm-arco.github.io/debian/
Suites: sid
Components: main
Signed-By: /etc/apt/trusted.gpg.d/uclm-arco.asc
EOF

apt update

echo "file /etc/apt/sources.list.d/arco.sources was created."
