#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING AWSCLI        ################"
echo "################################################################"

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

rm -rf aws
rm -rf awscliv2.zip

echo "################################################################"
echo "#############           AWSCLI INSTALLED        ################"
echo "################################################################"