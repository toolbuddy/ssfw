#!/bin/bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install -y docker-ce

# add user into docker group
sudo groupadd docker
sudo usermod -aG docker $USER

echo "---------------"
echo "Need to reboot to re-activated the user privilege!"
echo "---------------"