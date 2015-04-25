#!/bin/bash

ssh_dir="/etc/ssh"
dir=$(pwd)
echo "Symlinking Dot files"

ln -sv $dir/zshrc $HOME/.zshrc
ln -sv $dir/bashrc $HOME/.bashrc
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

