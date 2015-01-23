# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lukerandall"
#ZSH_THEME="murilasso"


plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
pathBase=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:~/.composer/vendor/bin
pathWin=:/cygdrive/c/Program\ Files/nodejs:/cygdrive/c/Users/jordon/AppData/Roaming/npm:/cygdrive/c/HashiCorp/Vagrant/bin:/cygdrive/c/adb:/cygdrive/c/Program\ Files/gradle-2.1

case `uname` in
    *CYGWIN*) export PATH=${pathBase}$pathWin ;;
	*) export PATH=$pathBase;;
esac

## Aliases

alias upgrade="sudo packer -Syu --noconfirm --noedit"
alias uu="sudo apt-get update && sudo apt-get upgrade"
alias start="sudo systemctl start"
alias senable="sudo systemctl enable"
alias status="sudo systemctl -l status"
alias stop="sudo systemctl stop"
alias sdisable="sudo systemctl disable"
alias reload="sudo systemctl daemon-reload"

alias fuck='sudo $(fc -ln -1)'
alias fucking='sudo'
alias install='apt-get install'

alias sown="sudo chown -R nobody:nobody"
alias smod="sudo chmod -R 777"
function permissions {
	sudo chown -R nobody:nobody $1
	sudo chmod -R 777 $1
}
alias perms=permissions

alias vm="ssh vagrant@127.0.0.1 -p 2222"

alias sshx="export DISPLAY=localhost:0.0 && ssh -Y"
alias home="ssh jordon@dehoog.me"
alias unraid="ssh root@10.0.0.3"
alias lisa="ssh user@10.0.0.4"
alias owncloud="ssh root@10.0.0.5"

alias virsh="sudo virsh"
alias list="sudo virsh list"
alias psg="ps aux | grep "

#lxc stuff
alias lstart="sudo lxc-start -n"
alias lstop="sudo lxc-stop -n"
alias lconsole="sudo lxc-console -n"
alias lattach="sudo lxc-attach -n"
alias linfo="sudo lxc-info -n"
alias ltop="sudo lxc-top -n"
alias ldestroy="sudo lxc-destroy -n"

function commitNPush {
	msg=$1
	for arg in ${@:2}
	do
		msg="$msg $arg"	    
	done
	git commit -m $msg
	git push	
}
alias gcnp=commitNPush

function makeNChangeDirectory {
	mkdir $1 && cd $1
}
alias mkcd="makeNChangeDirectory"

v() {
command="$*"
vagrant ssh -c "cd /vagrant && $command"
}
