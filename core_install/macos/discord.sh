#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING DISCORD       ################"
echo "################################################################"

# Generate a random file name
tmp_file=/tmp/`openssl rand -base64 10 | tr -dc '[:alnum:]'`.dmg
apps_folder='/Applications'

# Download file
curl -# -L -o $tmp_file "https://discord.com/api/download?platform=osx"

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
echo "#############          DISCORD INSTALLED        ################"
echo "################################################################"
