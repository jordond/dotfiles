#!/bin/bash

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

rm ~/.config/fish/fishfile
rm ~/.config/fish/config.fish
rm ~/.config/fish/functions/start_agent.fish

echo "Copying fish settings"
ln -sv $dir/config/fish/fishfile ~/.config/fish/fishfile
ln -sv $dir/config/fish/config.fish ~/.config/fish/config.fish
ln -sv $dir/config/fish/functions/start_agent.fish ~/.config/fish/functions/start_agent.fish

fish && fisher

set fish_greeting