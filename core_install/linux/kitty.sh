#!/bin/bash
set -e

echo "################################################################"
echo "#############          INSTALLING KITTY        ################"
echo "################################################################"

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
  dest=$HOME/.local/ \
  launch=n

mkdir -p $HOME/.config/kitty
cp $1/resources/kitty.conf $HOME/.config/kitty/

echo "[Desktop Entry]
Version=1.0
Type=Application
Name=terminal
GenericName=Terminal emulator
Comment=Fast, feature-rich, GPU based terminal
TryExec=/home/luispe/.local/kitty.app/bin/kitty
Exec=/home/luispe/.local/kitty.app/bin/kitty
Icon=/home/luispe/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png
Categories=System;TerminalEmulator;" > $HOME/.local/share/applications/kitty.desktop

sudo update-desktop-database

echo "################################################################"
echo "#############            KITTY INSTALLED        ################"
echo "################################################################"
