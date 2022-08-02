#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING GOLANG        ################"
echo "################################################################"

echo "What version of goland do you want to install?"
read go_version
GOLANG_VERSION="${go_version:=1.18}"

wget https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go$GOLANG_VERSION.linux-amd64.tar.gz

echo 'export PATH=$PATH:/usr/local/go/bin' >>$HOME/.zshenv
echo 'export GO111MODULE=on' >>$HOME/.zshenv

rm go$GOLANG_VERSION.linux-amd64.tar.gz

echo "################################################################"
echo "#############           GOLANG INSTALLED        ################"
echo "################################################################"
