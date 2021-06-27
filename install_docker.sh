#!/usr/bin/bash

#installing Docker on Ubuntu Focal 20.04

# Update the apt package index and install packages to allow apt to use a repository over HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release 

#add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

#set up stable repo
echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# install Docker engine 
# Update the apt package index, 
# and install the latest version of Docker Engine and containerd

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

systemctl enable docker 
systemctl start docker 
usermod -aG docker ubuntu
