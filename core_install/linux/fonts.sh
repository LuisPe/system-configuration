#!/bin/bash
set -e

echo "################################################################"
echo "#############           INSTALLING FONTS        ################"
echo "################################################################"

mkdir -p $HOME/.local/share/fonts
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip
unzip JetBrainsMono-2.242.zip -d $HOME/.local/share/fonts
fc-cache -f -v
rm JetBrainsMono-2.242.zip

echo "################################################################"
echo "#############          FONTS INSTALLED          ################"
echo "################################################################"

