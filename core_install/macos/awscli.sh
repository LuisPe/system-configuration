#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING AWSCLI        ################"
echo "################################################################"

curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

rm -rf AWSCLIV2.pkg

echo "################################################################"
echo "#############           AWSCLI INSTALLED        ################"
echo "################################################################"