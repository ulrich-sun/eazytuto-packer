#!/bin/bash
sudo yum update -y
sudo yum -y install epel-release
sudo yum install -y python3 git
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker centos
sudo systemctl restart docker
sudo systemctl enable docker
sudo yum update -y
sudo yum install  git nano docker-compose-plugin -y
curl -o /tmp/docker-compose.yml https://raw.githubusercontent.com/ulrich-sun/eazytuto-packer/main/docker-compose.yml
cd /tmp/
docker compose up -d
echo "Your stack it's up and running"
echo "Good Jobs"