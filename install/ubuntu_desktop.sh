#!/bin/bash
# Install all base packages listed here

BASE_PACKAGES="git curl wget zsh pv ngrep dstat ncdu mtr ppa-purge unity-tweak-tool htop sshfs autossh tmux iftop iotop vim xclip tree "
EXTRA_PACKAGES="deluge steam unrar p7zip-full"
PPA_PACKAGES="git plank numix-icon-theme-circle numix-plank-theme numix-gtk-theme numix-folders"

NODEJS_URL="https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh"
NODE="/home/$USER/.nvm/nvm.sh"
NODE_PACKAGES="node-inspector webpack depcheck"

echo "Need Root for installing packages"
sudo sh -c 'echo "Got Root!"'

echo "Adding PPAs..."

sudo add-apt-repository ppa:ricotz/docky -y
sudo add-apt-repository ppa:numix/ppa -y
sudo add-apt-repository ppa:git-core/ppa -y
echo ""

echo "Updating & Upgrading..."
sudo apt-get update
sudo apt-get -y upgrade
echo ""

sudo apt-get install -y $BASE_PACKAGES
sudo apt-get install -y $PPA_PACKAGES
sudo apt-get install -y $EXTRA_PACKAGES

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing NodeJS..."
wget -qO- $NODEJS_URL | bash
echo ""

NODE install node
NODE alias default node

source ~/.zshrc

echo -n "Would you like to install the node packages? [Y/n] "
read confirm
if [[ $confirm == "Y" || $confirm == "y" || $confirm == "" ]]; then
  echo "Installing Node packages..."
  echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
  npm install -g $NODE_PACKAGES
fi

echo ""
echo "Script is all done, hopefully it all went well."
