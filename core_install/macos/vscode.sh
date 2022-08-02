#!/bin/bash
set -e

echo "################################################################"
echo "#############         INSTALLING VSCODE         ################"
echo "################################################################"

curl 'https://code.visualstudio.com/sha/download?build=stable&os=darwin-arm64' -o VSCode-darwin-arm64
#unzip VSCode-darwin-arm64.zip
#sudo cp -rf *.app /Applications

#cat << EOF >> ~/.zshrc
# Add Visual Studio Code (code)
#export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
#EOF

#code --install-extension GitHub.github-vscode-theme
#code --install-extension golang.Go
#code --install-extension mhutchie.git-graph
#code --install-extension GitHub.vscode-pull-request-github

echo "################################################################"
echo "#############          VSCODE INSTALLED         ################"
echo "################################################################"

