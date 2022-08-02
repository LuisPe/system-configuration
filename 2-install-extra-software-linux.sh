#!/bin/bash
set -e

##################################################################################################################
# Written to be used on 64 bits computers lemp10 (LemurPro System76 computer)
# Author 	: 	luispe
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

PATH_EXEC=$(dirname "$0")               # relative
PATH_EXEC=$(cd "$PATH_EXEC" && pwd)     # absolutized and normalized
if [[ -z "$PATH_EXEC" ]] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi

# ssh
#sh core_install/linux/ssh.sh $PATH_EXEC

# Git
#sh core_install/linux/git.sh

# ZSH
#sh core_install/linux/zsh.sh $PATH_EXEC

# Font
#sh core_install/linux/fonts.sh

# n
#sh core_install/linux/n.sh

# Vim
#sh core_install/linux/vim.sh $PATH_EXEC

# kitty
#sh core_install/linux/kitty.sh $PATH_EXEC

# awscli
#sh core_install/linux/awscli.sh

# aws vpn
#sh core_install/linux/awsvpn.sh

# terraform
#sh core_install/linux/terraform.sh

# Golang
#sh core_install/linux/golang.sh

# Rust
#sh core_install/linux/rust.sh

# Python
#sh core_install/linux/python.sh

# kubectl
#sh core_install/linux/kubectl.sh

# docker
#sh core_install/linux/docker.sh

# docker compose
#sh core_install/linux/docker-compose.sh

# minikube
#sh core_install/linux/minikube.sh

# vscode
#sh core_install/linux/vscode.sh

# spotify
#sh core_install/linux/spotify.sh

# discord
#sh core_install/linux/discord.sh

# slack
#sh core_install/linux/slack.sh
