#!/bin/bash
set -e


echo "################################################################"
echo "#############           INSTALLING DOCKER       ################"
echo "################################################################"

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update

curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | sudo apt-key add - \
  && sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo groups luispe && sudo usermod -a -G docker luispe

sudo systemctl enable docker.service

sudo systemctl enable containerd.service

echo "################################################################"
echo "#############          DOCKER INSTALLED         ################"
echo "################################################################"

