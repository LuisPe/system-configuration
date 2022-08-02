#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING KUBECTL       ################"
echo "################################################################"

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install kubectl -y

echo "source <(kubectl completion zsh)" >>$HOME/.zshrc
echo 'alias k=kubectl' >>$HOME/.zshrc
echo 'compdef __start_kubectl k' >>$HOME/.zshrc

echo "################################################################"
echo "#############         KUBECTL INSTALLED         ################"
echo "################################################################"

