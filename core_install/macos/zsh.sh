#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING ZSH           ################"
echo "################################################################"

# Configure zim framework
echo "Install zimfw"
rm -f $HOME/.zimrc $HOME/.zlogin $HOME/.zshenv $HOME/.zshrc
touch $HOME/.zshenv
touch $HOME/.hushlogin

cp $1/zsh/macos/.zshrc $HOME/
cp $1/zsh/.zimrc $HOME/

echo "################################################################"
echo "#############           ZSH INSTALLED           ################"
echo "################################################################"
