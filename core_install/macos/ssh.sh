#!/bin/bash
set -e

echo "################################################################"
echo "#############         CONFIGURE SSH KEYS        ################"
echo "################################################################"

mkdir -p $HOME/.ssh
cp $1/ssh/id_ed25519 $HOME/.ssh/
cp $1/ssh/id_ed25519.pub $HOME/.ssh
cp $1/ssh/id_rsa $HOME/.ssh
cp $1/ssh/id_rsa.pub $HOME/.ssh
cp $1/ssh/id_pomelo_rsa $HOME/.ssh

chmod 0400 $HOME/.ssh/id_ed25519
chmod 644 $HOME/.ssh/id_ed25519.pub
chmod 0400 $HOME/.ssh/id_rsa
chmod 644 $HOME/.ssh/id_rsa.pub
chmod 0400 $HOME/.ssh/id_pomelo_rsa

echo "################################################################"
echo "#############      CONFIGURE SSH KEY SUCCESS    ################"
echo "################################################################"
