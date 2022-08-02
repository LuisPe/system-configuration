#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING DISCORD       ################"
echo "################################################################"

wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb

sudo dpkg -i discord.deb
sudo apt --fix-broken install
rm -f discord.deb

echo "################################################################"
echo "#############          DISCORD INSTALLED        ################"
echo "################################################################"
