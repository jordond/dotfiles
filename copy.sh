#!/bin/bash

ssh_dir="/etc/ssh"

echo "Symlinking Dot files"

ln -sv ./zshrc $HOME/.zshrc
ln -sv ./bashrc $HOME/.bashrc
ln -sv ./tmux.conf $HOME/.tmux.conf
ln -sv ./git/gitconfig $HOME/.gitconfig

echo
echo -n "Copy over ssh files? [y/N] "
read confirm
if [[ $confirm == "y" || $confirm == "Y" ]]; then
    cp -v ./ssh/* $ssh_dir
fi

echo
echo "All Finished."

