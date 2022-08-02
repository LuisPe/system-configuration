#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING AWS VPN       ################"
echo "################################################################"

curl https://d20adtppz83p9s.cloudfront.net/OSX/latest/AWS_VPN_Client.pkg -o awsvpnclient.pkg
sudo installer -pkg awsvpnclient.pkg -target /

rm -f awsvpnclient.pkg

echo "################################################################"
echo "#############          AWS VPN INSTALLED         ################"
echo "################################################################"