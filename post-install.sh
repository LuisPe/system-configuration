#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo export PATH="/usr/local/bin:$PATH" >> ~/.zshenv
  
  sudo apt-get install -f -y
  sudo apt-get autoremove -y
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo export PATH="/usr/local/bin:$PATH" >> ~/.zshenv
fi
