#!/bin/bash
set -e


echo "################################################################"
echo "#############       NSTALLING DOCKER-COMPOSE    ################"
echo "################################################################"

curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o $HOME/.local/bin/docker-compose
chmod +x $HOME/.local/bin/docker-compose

# Add docker-compose completion 
mkdir -p $HOME/.zsh/completion
curl \
    -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/zsh/_docker-compose \
    -o ~/.zsh/completion/_docker-compose
echo 'fpath=($HOME/.zsh/completion $fpath)' >> $HOME/.zshrc 
exec /bin/zsh

echo "################################################################"
echo "#############       DOCKER-COMPOSE INSTALLED    ################"
echo "################################################################"

