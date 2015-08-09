#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias shutdown='echo'
alias ls='ls --color=auto'
alias nani='livestreamer http://www.twitch.tv/naniwasc2 high'
alias ll='ls -l --color=auto'
alias inst='sudo pacman -S'
alias uinst='sudo pacman -Rsnc'
alias i3conf='vim ~/.i3/config'
alias battlenet='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Battle.net/Battle.net\ Launcher.exe'
PS1='\u-\W\$ '

export WINEDEBUG=-all
export WINEARCH=win64
export TERMINAL=urxvt
export EDITOR=vim
