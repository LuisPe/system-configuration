#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING Goland        ################"
echo "################################################################"

# Generate a random file name
tmp_file=/tmp/`openssl rand -base64 10 | tr -dc '[:alnum:]'`.dmg
apps_folder='/Applications'

# Download file
curl -# -L -o $tmp_file https://download.jetbrains.com/go/goland-2022.1-aarch64.dmg

echo "Mounting image..."
volume=`hdiutil mount $tmp_file | tail -n1 | perl -nle '/(\/Volumes\/[^ ]+)/; print $1'`

# Locate .app folder and move to /Applications
app=`find $volume/. -name *.app -maxdepth 1 -type d -print0`
echo "Copying `echo $app | awk -F/ '{print $NF}'` into $apps_folder..."
cp -ir $app $apps_folder

# Unmount volume, delete temporal file
echo "Cleaning up..."
hdiutil unmount $volume -quiet
rm $tmp_file


echo "################################################################"
echo "#############          Goland INSTALLED         ################"
echo "################################################################"
