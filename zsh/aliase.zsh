alias diff='colordiff'
alias dir='dir --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ip='ip -c'
alias gpg='gpg2'
alias pcregrep='pcregrep --color=auto'
alias vdir='vdir --color=auto'
alias watch='watch --color'

alias torrent='transmission-cli -ep'


alias ls='exa'
alias ll='exa -l'
alias la='exa -la'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

alias netstat='ping 8.8.8.8'
alias wget='wget -c'
alias mkdir='mkdir -pv'
alias dd='dd status=progress'
alias cx='chmod +x'
alias fj='firejail --seccomp --private --net=none'
alias fx='firejail --seccomp --net=none'
alias fjn='firejail --seccomp --private'

alias inst='sudo xbps-install'
alias install='sudo xbps-install'
alias uinst='sudo xbps-remove -R'
alias uninstall='sudo xbps-remove -R'
alias update='sudo xbps-install -Su'
alias search='sudo xbps-query -Rs'

alias i3conf "vim $DOTFILES/i3/config"
alias cddot "cd $DOTFILES"
alias cddev "cd ~/Documents/dev"
alias givepw='cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c 16; echo'
alias rsync='rsync -a --stats --progress'
alias ccmake='cmake .; and make'

alias dirty='watch grep -e Dirty: -e Writeback: /proc/meminfo'
