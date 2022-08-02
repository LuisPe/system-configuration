#!/bin/bash
set -e

##################################################################################################################
# Written to be used on 64 bits computers
# Author 	  : 	luispe
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# software from 'normal' repositories
sudo apt-get install \
apt-transport-https \
openssl \
curl \
openssh-server \
ca-certificates \
zlib1g \
zlib1g-dev \
libpcre3 \
libpcre3-dev \
build-essential \
libssl-dev \
gnupg \
gnupg-agent \
software-properties-common \
libappindicator3-1 \
lsb-release -y

###############################################################################################

# installation of zippers and unzippers
sudo apt-get install \
p7zip-rar \
p7zip-full \
unace \
unrar \
zip \
unzip \
sharutils \
rar \
uudeview \
mpack \
arj \
cabextract \
file-roller -y

###############################################################################################

# create neccessary folder
mkdir -p $HOME/.local/bin

echo "################################################################"
echo "##################    core software installed  #################"
echo "################################################################"
