#!/bin/bash

sudo sed -i 's/#Port 22/Port 2124/' /etc/ssh/sshd_config
sudo ufw allow 2124
sudo ufw allow 1337
sudo systemctl restart sshd.service
sudo apt-get update -y
sudo apt install default-jdk -y
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install docker-ce -y
sudo ufw enable