#!/bin/bash
# Install all base packages listed here

BASE_PACKAGES="ssh-agent fish git curl wget zsh pv ngrep dstat ncdu mtr ppa-purge htop sshfs autossh tmux iftop iotop vim xclip tree docker"
EXTRA_PACKAGES="unrar p7zip-full hdparm hddtemp slurm snapraid rsnapshot"
PPA_PACKAGES="git"

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

curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
curl -Lo ~/.config/fish/functions/fin.fish --create-dirs git.io/fin

fish && omf install eclm

echo ""
echo "Script is all done, hopefully it all went well."
