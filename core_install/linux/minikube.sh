#!/bin/bash
set -e

echo "################################################################"
echo "#############           INSTALL MINIKUBE        ################"
echo "################################################################"

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

echo "################################################################"
echo "#############          MINIKUBE INSTALLED       ################"
echo "################################################################"

