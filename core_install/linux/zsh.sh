#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING ZSH           ################"
echo "################################################################"

sudo apt update && sudo apt install zsh -y
chsh -s /usr/bin/zsh

# Configure zim framework
echo "Install zimfw"
rm -f $HOME/.zimrc $HOME/.zlogin $HOME/.zshenv $HOME/.zshrc
touch $HOME/.zshenv

cp $1/zsh/linux/.zshrc $HOME/
cp $1/zsh/.zimrc $HOME/

echo "################################################################"
echo "#############           ZSH INSTALLED           ################"
echo "################################################################"
