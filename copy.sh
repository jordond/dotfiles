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

echo "Copying visual studio code settings"
mkdir -p ~/.config/Code
rm ~/.config/Code/User
ln -sv $dir/config/Code/User ~/.config/Code

echo "Linking config"
ln -sv $dir/i3 ~/.i3
ln -sv $dir/i3/scripts/* /usr/local/bin
ln -sv $dir/config/gtk-3.0 ~/.config/gtk-3.0
ln -sv $dir/compton.conf ~/.compton.conf
ln -sv $dir/gtkrc-2.0 ~/.gtkrc-2.0
ln -sv $dir/fehbg ~/.fehbg
ln -sv $dir/fonts ~/.fonts

sudo ln -sv $dir/i3/events/LID_i3-lid /etc/acpi/events
sudo ln -sv $dir/i3/scripts/i3-lid.sh /etc/acpi

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

