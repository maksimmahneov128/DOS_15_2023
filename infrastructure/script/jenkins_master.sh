#!/bin/bash

sudo sed -i 's/#Port 22/Port 2123/' /etc/ssh/sshd_config
sudo ufw allow 2123
sudo systemctl restart sshd.service
sudo apt-get update -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt install default-jdk -y
sudo apt-get install jenkins -y
sudo sed -i 's/Environment="JENKINS_PORT=8080"/Environment="JENKINS_PORT=8183"/' /usr/lib/systemd/system/jenkins.service
sudo systemctl daemon-reload
sudo systemctl stop jenkins
sudo ufw allow 8183
sudo systemctl start jenkins
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install docker-ce -y
sudo ufw enable