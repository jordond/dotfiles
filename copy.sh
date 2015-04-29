#!/bin/bash

ssh_dir="/etc/ssh"
dir=$(pwd)

echo "Installing ohmyzsh..."
cd $HOME
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh > /dev/null 2>&1

echo "Removing any old files"
cd $dir
rm $HOME/.zshrc
rm $HOME/.tmux.conf
rm $HOME/.gitconfig

echo "Symlinking Dot files"
ln -sv $dir/zshrc $HOME/.zshrc
ln -sv $dir/tmux.conf $HOME/.tmux.conf
ln -sv $dir/git/gitconfig $HOME/.gitconfig

echo
echo -n "Copy over ssh files? [y/N] "
read confirm
if [[ $confirm == "y" || $confirm == "Y" ]]; then
    sudo cp -v ./ssh/* $ssh_dir
fi

echo
echo "All Finished."

