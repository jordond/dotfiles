# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="lukerandall"

ZSH_CUSTOM=$HOME/.zsh_custom
ZSH_THEME="jordon"

plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
pathBase=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:~/.composer/vendor/bin:~/Android/Sdk/platform-tools
pathWin=:/cygdrive/c/Program\ Files/nodejs:/cygdrive/c/Users/jordon/AppData/Roaming/npm:/cygdrive/c/HashiCorp/Vagrant/bin:/cygdrive/c/adb:/cygdrive/c/Program\ Files/gradle-2.1

case `uname` in
    *CYGWIN*) export PATH=${pathBase}$pathWin ;;
	*) export PATH=$pathBase;;
esac

## Aliases

alias code="cd $HOME/code"
alias z="source ~/.zshrc"

function gitclone {
	git clone "git@github.com:$1"
}
function bitbucketclone {
	git clone "git@bitbucket.org:$1"
}
alias gc="gitclone"
alias bgc="bitbucketclone"

alias upgrade="sudo packer -Syu --noconfirm --noedit"
alias uu="sudo apt-get update && sudo apt-get upgrade"
alias start="sudo systemctl start"
alias senable="sudo systemctl enable"
alias status="sudo systemctl -l status"
alias stop="sudo systemctl stop"
alias sdisable="sudo systemctl disable"
alias reload="sudo systemctl daemon-reload"

alias s="ssh user@maverick"
alias ss="ssh user@ssh.hoogit.ca"
alias sshx="export DISPLAY=localhost:0.0 && ssh -Y"

alias fuck='sudo $(fc -ln -1)'
alias fucking='sudo'

alias install='apt-get install'
alias ag='sudo apt-get'

alias www='cd /etc/nginx/www'

alias sown="sudo chown -R nobody:nogroup"
alias smod="sudo chmod -R 777"
function permissions {
	sudo chown -R nobody:nogroup $1
	sudo chmod -R 777 $1
}
alias perms=permissions

alias vm="ssh vagrant@127.0.0.1 -p 2222"

alias virsh="sudo virsh"
alias list="sudo virsh list"
alias psg="ps aux | grep "

alias temps="sudo hddtemp /dev/sd[a-z]"

#lxc stuff
alias lstart="sudo lxc-start -n"
alias lstop="sudo lxc-stop -n"
alias lconsole="sudo lxc-console -n"
alias lattach="sudo lxc-attach -n"
alias linfo="sudo lxc-info -n"
alias ltop="sudo lxc-top -n"
alias ldestroy="sudo lxc-destroy -n"

function makeNChangeDirectory {
	mkdir $1 && cd $1
}
alias mkcd="makeNChangeDirectory"

v() {
	command="$*"
	vagrant ssh -c "cd /vagrant && $command"
}

export NVM_DIR="/home/$USER/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
