#!/bin/bash

wget -q -nc https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 &> /dev/null
mv cloudflared-linux-amd64 cloudflared
chmod +x cloudflared
apt-get update &> /dev/null
apt-get install -y ssh openssh-server &> /dev/null

echo root:0000 | chpasswd

mkdir -p /var/run/sshd
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

service ssh start

./cloudflared tunnel --url ssh://localhost:22 --logfile ./cloudflared.log --metrics localhost:45678