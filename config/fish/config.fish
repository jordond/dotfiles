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
eval sh $HOME/dotfiles/colors/base16-default.dark.sh

screenfetch
