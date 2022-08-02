#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING PYTHON        ################"
echo "################################################################"

sudo apt-get update
sudo apt-get install python3 python3-venv python3-pip -y

echo "################################################################"
echo "#############           PYTHON INSTALLED        ################"
echo "################################################################"