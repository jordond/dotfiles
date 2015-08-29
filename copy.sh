#!/bin/bash

ssh_dir="/etc/ssh"
dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing ohmyzsh..."
  cd $HOME
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh > /dev/null 2>&1
fi

echo "Copying custom zsh files"
rm $HOME/.zsh_custom > /dev/null 2>&1
ln -sv $dir/zsh_custom $HOME/.zsh_custom

echo "Symlinking Dot files"
cd $dir
rm $HOME/.zshrc > /dev/null 2>&1
rm $HOME/.tmux.conf > /dev/null 2>&1
rm $HOME/.gitconfig > /dev/null 2>&1
rm $HOME/.gitignore > /dev/null 2>&1

ln -sv $dir/zshrc $HOME/.zshrc
ln -sv $dir/tmux.conf $HOME/.tmux.conf
ln -sv $dir/git/gitconfig $HOME/.gitconfig
ln -sv $dir/git/gitignore $HOME/.gitignore

echo
echo -n "Copy over ssh files? [y/N] "
read confirm
if [[ $confirm == "y" || $confirm == "Y" ]]; then
    mkdir -p ~/.ssh
    cp $dir/ssh/authorized_keys ~/.ssh
    sudo cp -v $dir/ssh/* $ssh_dir
fi

echo
echo "All Finished."

