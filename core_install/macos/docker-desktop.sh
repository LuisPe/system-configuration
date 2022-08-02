#!/bin/bash
set -e

echo "################################################################"
echo "#############       INSTALLING DOCKER-DESKTOP   ################"
echo "################################################################"

# Generate a random file name
tmp_file=/tmp/`openssl rand -base64 10 | tr -dc '[:alnum:]'`.dmg
apps_folder='/Applications'

# Download file
curl -# -L -o $tmp_file "https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64"

echo "Mounting image..."
volume=`hdiutil mount $tmp_file | tail -n1 | perl -nle '/(\/Volumes\/[^ ]+)/; print $1'`

# Locate .app folder and move to /Applications
app=`find $volume/. -name *.app -maxdepth 1 -type d -print0`
echo "Copying `echo $app | awk -F/ '{print $NF}'` into $apps_folder..."
cp -ir $app $apps_folder

# Unmount volume, delete temporal file
echo "Cleaning up executable"
hdiutil unmount $volume -quiet
rm $tmp_file

sudo ln -s /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
sudo ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose

echo "################################################################"
echo "#############      DOCKER-DESKTOP INSTALLED     ################"
echo "################################################################"

