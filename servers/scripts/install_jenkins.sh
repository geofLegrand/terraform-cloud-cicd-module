#!/bin/bash

sudo yum update -y

sudo yum install -y wget 

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum upgrade -y

sudo yum install java-11* -y
## Install Jenkins then Enable the Jenkins service to start at boot :
sudo yum install jenkins -y

sudo systemctl enable jenkins

## Start Jenkins as a service:
sudo systemctl start jenkins

## install git
sudo yum install git -y

# install pip
sudo yum install python3-pip.noarch -y

sleep 5

#sudo cat /var/lib/jenkins/secrets/initialAdminPassword
# trivy Security scan tool install

sudo wget https://github.com/aquasecurity/trivy/releases/download/v0.53.0/trivy_0.53.0_Linux-64bit.tar.gz

tar zxvf trivy_*.tar.gz
sudo mv trivy /usr/local/bin/

## Helm install 

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

## Install docker 
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker -y

sudo usermod -aG docker ec2-user #jenkins

sudo systemctl restart docker

ls -l /var/run/docker.sock
sudo chown root:docker /var/run/docker.sock
sudo chown ec2-user:docker /var/run/docker.sock
sudo chmod 660 /var/run/docker.sock

sudo systemctl status docker


