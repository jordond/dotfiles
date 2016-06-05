#!/bin/bash

ssh_dir="/etc/ssh"
dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


echo "Symlinking Dot files"
cd $dir
rm $HOME/.tmux.conf > /dev/null 2>&1
rm $HOME/.gitconfig > /dev/null 2>&1
rm $HOME/.gitignore > /dev/null 2>&1

ln -sv $dir/tmux.conf $HOME/.tmux.conf
ln -sv $dir/git/gitconfig $HOME/.gitconfig
ln -sv $dir/git/gitignore $HOME/.gitignore

echo "Copying visual studio code settings"
mkdir -p ~/.config/Code
rm ~/.config/Code/User
ln -sv $dir/config/Code/User ~/.config/Code

echo "Copying fish settings"
ln -sv $dir/config/fish/fishfile ~/.config/fish/fishfile
ln -sv $dir/config/fish/config.fish ~/.config/fish/config.fish
ln -sv $dir/config/fish/base16-railcasts.dark.sh ~/.config/fish/base16-railcasts.dark.sh
ln -sv $dir/config/fish/functions/start_agent.fish ~/.config/fish/functions/start_agent.fish


rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "On tmux first run press 'bind-key shift I'"

echo
echo "Linking SSH files"
mkdir -p ~/.ssh
rm ~/.ssh/*
ln -sv $dir/ssh/authorized_keys ~/.ssh
ln -sv $dir/ssh/config ~/.ssh
ln -sv $dir/ssh/main.key.pub ~/.ssh/id_rsa.pub
ln -sv $dir/ssh/github.key.pub ~/.ssh

sudo rm -f $ssh_dir/sshd_config
sudo rm -f $ssh_dir/ssh_config
sudo ln -sv $dir/ssh/sshd_config $ssh_dir
sudo ln -sv $dir/ssh/ssh_config $ssh_dir

echo
echo "All Finished."

