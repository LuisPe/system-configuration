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
#sh core_install/macos/ssh.sh $PATH_EXEC

# Git
#sh core_install/macos/git.sh

# ZSH
#sh core_install/macos/zsh.sh $PATH_EXEC

# Font
#sh core_install/macos/fonts.sh

# n
#sh core_install/macos/n.sh

# Vim
#sh core_install/macos/vim.sh $PATH_EXEC

# iterm
#sh core_install/macos/iterm.sh $PATH_EXEC

# awscli
#sh core_install/macos/awscli.sh

# aws vpn
#sh core_install/macos/awsvpn.sh

# terraform
#sh core_install/macos/terraform.sh

# Golang
#sh core_install/macos/golang.sh

# Goland
#sh core_install/macos/goland.sh

# Python
#sh core_install/macos/python.sh

# kubectl
#sh core_install/macos/kubectl.sh

# docker
#sh core_install/macos/docker-desktop.sh

# minikube
#sh core_install/macos/minikube.sh

# vscode
#sh core_install/macos/vscode.sh

# spotify
#sh core_install/macos/spotify.sh

# discord
#sh core_install/macos/discord.sh

# slack
#sh core_install/macos/slack.sh

# Rust
#sh core_install/linux/rust.sh
