#!/bin/bash

wget -q -nc https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
mv cloudflared-linux-amd64 cloudflared
chmod +x cloudflared
apt-get install -y ssh openssh-server

mkdir -p /var/run/sshd
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

service ssh start

./cloudflared tunnel --url ssh://localhost:22 --logfile ./cloudflared.log --metrics localhost:45678