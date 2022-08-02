#!/bin/bash
set -e

echo "################################################################"
echo "#############          SYSTEM MAINTENANCE       ################"
echo "################################################################"

echo "Would you like update system? Y/n (default Yes)"
read ask

if [[ -z "$ask" || $ask = "Y" || $ask = "y" ]] ; then
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt autoclean -y
else 
    exit 0
fi


echo "################################################################"
echo "#############      FINISH SYSTEM MAINTENANCE    ################"
echo "################################################################"
