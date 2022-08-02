#!/bin/bash
set -e

echo "################################################################"
echo "#############        INSTALLING TERRAFORM       ################"
echo "################################################################"

curl "https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_linux_amd64.zip" -o terraform.zip
unzip terraform.zip
chmod +x terraform
sudo mv terraform /usr/local/bin

rm terraform.zip

echo "################################################################"
echo "#############          TERRAFORM INSTALLED      ################"
echo "################################################################"