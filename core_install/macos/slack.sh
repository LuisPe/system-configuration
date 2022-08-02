#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING SLACK         ################"
echo "################################################################"

wget "https://downloads.slack-edge.com/releases/linux/4.23.0/prod/x64/slack-desktop-4.23.0-amd64.deb" -O slack.deb
sudo dpkg -i slack.deb
sudo apt --fix-broken install
rm -f slack.deb

echo "################################################################"
echo "#############           SLACK INSTALLED         ################"
echo "################################################################"

