#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING KUBECTL       ################"
echo "################################################################"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/arm64/kubectl"
chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl
sudo chown root: /usr/local/bin/kubectl

echo "source <(kubectl completion zsh)" >>$HOME/.zshrc
echo 'alias k=kubectl' >>$HOME/.zshrc
echo 'compdef __start_kubectl k' >>$HOME/.zshrc

echo "################################################################"
echo "#############         KUBECTL INSTALLED         ################"
echo "################################################################"

