# Path to your oh-my-zsh installation.
source ~/dotfiles/zsh/colors.zsh
source ~/dotfiles/zsh/dotfiles.zsh
export ZSH="$HOMEDIR/.oh-my-zsh"

#ZSH settings

ZSH_THEME="agnoster"
#ENABLE_CORRECTION="true"

#oh-my-zsh plugins
plugins=(git zsh-history-substring-search dirhistory per-directory-history)

# User configuration
export PATH="/usr/bin/:/usr/local/bin/:/usr/local/sbin:/usr/sbin/:/usr/bin/core_perl/"
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='vim'

export ARCHFLAGS="-arch x86_64"

export WINEARCH=win64
export WINEPREFIX=~/.wine
export PLAYER='mpv'

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -lha --color=auto'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

alias netstat='ping 8.8.8.8'
alias wget='wget -c'
alias mkdir='mkdir -pv'
alias dd='dd status=progress'

alias inst='pacaur -S'
alias install='pacaur -S'
alias uinst='pacaur -Rsnc'
alias uninstall='pacaur -Rsnc'
alias update='sudo pacman -Syu && pacaur -Sua'
alias search='pacaur -Ss'
alias searchr='pacman -Ss'

alias sysen='sudo systemctl enable --now'
alias sysdis='sudo systemctl disable --now'
alias sysstart='sudo systemctl start'
alias sysstop='sudo systemctl stop'
alias sysstat='sudo systemctl status'

alias i3conf="vim $DOTFILES/i3/config"
alias cddot="cd $DOTFILES"
alias givepw='base64 /dev/urandom | head -c 10'
alias ccmake='cmake . && make'
alias reload='source ~/.zshrc'

source ~/dotfiles/zsh/functions.zsh

autoload -Uz compinit -u
compinit -u
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

