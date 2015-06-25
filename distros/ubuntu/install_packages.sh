#!/bin/bash
# Install all base packages listed here

BASE_PACKAGES="git curl wget zsh unity-tweak-tool htop sshfs autossh tmux iftop iotop google-chrome-beta"
EXTRA_PACKAGES="deluge steam pv ngrep iotop dstat ncdu mtr unrar p7zip-full ppa-purge"
PPA_PACKAGES="plank numix-icon-theme-circle numix-plank-theme numix-gtk-theme numix-folders"

NODEJS_URL="https://github.com/taaem/nodejs-linux-installer/releases/download/v0.3/node-install.sh"
NODE_PACKAGES="node-inspector gulp yo bower generator-angular-fullstack generator-ng-poly"

echo "Need Root for installing packages"
sudo sh -c 'echo "Got Root!"'

echo "Adding PPAs..."

sudo add-apt-repository ppa:ricotz/docky -y > /dev/null
sudo add-apt-repository ppa:numix/ppa -y > /dev/null
echo ""

echo "Updating & Upgrading..."
sudo apt-get update > /dev/null
sudo apt-get -y upgrade > /dev/null
echo ""

echo "Installing base packages..."
sudo apt-get install -y $BASE_PACKAGES > /dev/null
echo ""

echo "Installing PPA packages..."
sudo apt-get install -y $PPA_PACKAGES > /dev/null
echo ""

echo "Installing Extra packages..."
sudo apt-get install -y $EXTRA_PACKAGES > /dev/null
echo ""

echo "Installing NodeJS..."
wget -O - $NODEJS_URL | bash
echo ""

echo -n "Would you like to install the node packages? [Y/n] "
read confirm
if [[ $confirm == "Y" || $confirm == "y" || $confirm == "" ]]; then
  echo "Installing Node packages..."
  sudo npm install -g $NODE_PACKAGES
fi

echo ""
echo "Script is all done, hopefully it all went well."