#!/bin/bash
# Install all base packages listed here

BASE_PACKAGES="git curl wget zsh pv ngrep dstat ncdu mtr ppa-purge htop sshfs autossh tmux iftop iotop vim xclip tree docker"
EXTRA_PACKAGES="unrar p7zip-full hdparm hddtemp slurm snapraid rsnapshot"
PPA_PACKAGES="git"

NODEJS_URL="https://github.com/taaem/nodejs-linux-installer/releases/download/v0.3/node-install.sh"
NODE_PACKAGES="node-inspector gulp yo bower"

echo "Need Root for installing packages"
sudo sh -c 'echo "Got Root!"'

echo "Adding PPAs..."

sudo add-apt-repository ppa:git-core/ppa -y
echo ""

echo "Updating & Upgrading..."
sudo apt-get update
sudo apt-get -y upgrade
echo ""

echo "Installing base packages..."
sudo apt-get install -y $BASE_PACKAGES
echo ""

echo "Installing PPA packages..."
sudo apt-get install -y $PPA_PACKAGES
echo ""

echo "Installing Extra packages..."
sudo apt-get install -y $EXTRA_PACKAGES
echo ""

echo "Installing tmux plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing NodeJS..."
wget -O - $NODEJS_URL | bash
echo ""

echo -n "Would you like to install the node packages? [Y/n] "
read confirm
if [[ $confirm == "Y" || $confirm == "y" || $confirm == "" ]]; then
  echo "Installing Node packages..."
  echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
  sudo npm install -g $NODE_PACKAGES
fi

echo ""
echo "Script is all done, hopefully it all went well."