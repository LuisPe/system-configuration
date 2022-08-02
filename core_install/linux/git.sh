#!/bin/bash
set -e

echo "################################################################"
echo "################       INSTALLING GIT     ######################"
echo "################################################################"

sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update && sudo apt-get install git -y

# Git Variables
echo "What name do you want to use in git user.name?"
read git_config_user_name

echo "What email do you want to use in git user.email?"
read git_config_user_email

# Global set config
echo "Setting up your git global connfig"
git config --global user.name "$git_config_user_name"
git config --global user.email "$git_config_user_email"
git config --global init.defaultbranch main
git config --global pull.rebase false
git config --global --add --bool push.autoSetupRemote true
git config --global core.editor "vim"

# Aliases
git config --global alias.st status
git config --global alias.l 'log --pretty=format:"%C(yellow)%h | %ad%Cred%d | %Creset%s%Cblue | [%cn]" --decorate --date=short' \
git config --global alias.c 'commit -am $1' \
git config --global alias.undo 'reset --soft HEAD~1' \
git config --global alias.sc "stash clear" \
git config --global alias.ss "stash save $1" \
git config --global alias.sb 'fetch -p' \
git config --global alias.branches 'branch -a' \
git config --global alias.bc "git branch -D $1" \
git config --global alias.sw switch

echo "################################################################"
echo "###################        GIT INSTALLED        ################"
echo "################################################################"
