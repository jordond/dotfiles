#!/bin/bash

ssh_dir="/etc/ssh"
dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ ! -d "$1/.oh-my-zsh" ]; then
  echo "Installing ohmyzsh..."
  cd $1
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh > /dev/null 2>&1
fi

echo "Copying custom zsh files"
rm $1/.zsh_custom > /dev/null 2>&1
ln -sv $dir/zsh_custom $1/.zsh_custom

echo "Symlinking Dot files"
cd $dir
rm $1/.zshrc > /dev/null 2>&1
rm $1/.tmux.conf > /dev/null 2>&1
rm $1/.gitconfig > /dev/null 2>&1

ln -sv $dir/zshrc $1/.zshrc
ln -sv $dir/tmux.conf $1/.tmux.conf
ln -sv $dir/git/gitconfig $1/.gitconfig

echo
echo "Dotfiles copying finished"

