# Path to Oh My Fish install.
set -gx OMF_PATH "/home/jordon/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/jordon/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

for file in ~/.config/fish/conf.d/*.fish
    source $file
end

alias s="ssh user@maverick"
alias ss="ssh user@ssh.hoogit.ca"
alias uu="sudo apt-get update; sudo apt-get upgrade"
alias ua="sudo apt-get update; sudo apt-get -y upgrade; sudo apt-get -y dist-upgrade; sudo apt-get autoremove; sudo apt-get autoclean"
alias start "sudo systemctl start"
alias senable "sudo systemctl enable"
alias stop "sudo systemctl stop"
alias sdisable "sudo systemctl disable"
alias reload "sudo systemctl daemon-reload"

alias z="source ~/.config/fish/config.fish"

alias zz="vim ~/.config/fish/config.fish"
alias i3="vim ~/.i3/config"
alias install='apt-get install'
alias ag='sudo apt-get $argv'

alias l="ls -lahX"

function gc
  git clone git@github.com:$argv
end

function sstatus
  sudo systemctl status $argv
end

# Start ssh agent
start_agent

# Set theme
eval sh $HOME/.config/fish/base16-railcasts.dark.sh

screenfetch