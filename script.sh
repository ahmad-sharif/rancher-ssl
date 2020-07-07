#!/bin/bash
sudo apt update -y
sudo apt install docker.io
sudo apt install docker-compose
sudo mkdir -p /usr/local/etc/nginx/ssl
# Create the SSH keys
cd /usr/local/etc/nginx/ssl
sudo openssl req -x509 -nodes -subj \"/C=US/ST=GA/L=Atlanta/O=BPE/CN=rancher-dev.bpe.com\" -new -newkey rsa:4096 -keyout rancher.key -out rancher.crt -days 365
cd /home/ubuntu
git clone https://github.com/ahmad-sharif/rancher-ssl.git
cd /home/ubuntu/rancher-ssl
docker-compose build
docker-compose up -d
