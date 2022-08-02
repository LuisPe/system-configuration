#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING AWS VPN       ################"
echo "################################################################"

curl https://d20adtppz83p9s.cloudfront.net/GTK/latest/awsvpnclient_amd64.deb -o awsvpnclient_amd64.deb
sudo dpkg -i awsvpnclient_amd64.deb

rm awsvpnclient_amd64.deb

echo "################################################################"
echo "#############          AWS VPN INSTALLED         ################"
echo "################################################################"