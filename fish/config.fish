alias diff 'colordiff'
alias dir 'dir --color=auto'
alias egrep 'egrep --color=auto'
alias fgrep 'fgrep --color=auto'
alias ip 'ip -c'
alias pcregrep 'pcregrep --color=auto'
alias vdir 'vdir --color=auto'
alias watch 'watch --color'

alias torrent 'transmission-cli -b http://john.bitsurge.net/public/biglist.p2p.gz -ep'

alias ls 'exa'
alias ll 'exa -l'
alias la 'exa -la'

alias .. 'cd ..'
alias ... 'cd ../../'
alias .... 'cd ../../../'

alias netstat 'ping 8.8.8.8'
alias wget 'wget -c'
alias mkdir 'mkdir -pv'
alias dd 'dd status=progress'
alias fj 'firejail --seccomp --private --net=none'
alias fx 'firejail --seccomp --net=none'
alias fjn 'firejail --seccomp --private'

alias inst 'sudo xbps-install'
alias install 'sudo xbps-install'
alias uinst 'sudo xbps-remove -R'
alias uninstall 'sudo xbps-remove -R'
alias update 'sudo xbps-install -Su'
alias search 'sudo xbps-query -Rs'

alias i3conf "vim $DOTFILES/i3/config"
alias cddot "cd $DOTFILES"
alias cddev "cd ~/Documents/dev"
alias givepw 'base64 /dev/urandom | head -c 32'
alias rsync 'rsync -a --stats --progress'
alias ccmake 'cmake .; and make'

alias dirty 'watch grep -e Dirty: -e Writeback: /proc/meminfo'

set -gx DOTFILES /home/effi/dotfiles
set -gx LANG en_US.UTF-8
set -gx ARCHFLAGS "-arch x86_64"
set -gx WINEARCH win64
set -gx WINEPREFIX ~/.wine
set -gx WINEDEBUG -all
set -gx PLAYER mpv
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx XKB_DEFAULT_LAYOUT de
set -gx GOPATH /home/effi/go/
set -gx TERM xterm

set PATH /home/effi/go/bin /usr/bin/ /usr/local/bin/ /usr/local/sbin /usr/sbin/ /usr/bin/core_perl/

set -gx color0		"#282828"
set -gx color8		"#cc241d"
set -gx color1		"#98971a"
set -gx color9		"#d79921"
set -gx color2		"#458588"
set -gx color10		"#b16286"
set -gx color3		"#689d6a"
set -gx color11		"#a89984"
set -gx color4		"#928374"
set -gx color12		"#fb4934"
set -gx color5		"#b8bb26"
set -gx color13		"#fabd2f"
set -gx color6		"#83a598"
set -gx color14		"#d3869b"
set -gx color7		"#8ec07c"
set -gx color15		"#ebdbb2"

set fish_greeting ""

eval (dircolors -c ~/.dircolors | sed 's/>&\/dev\/null$//')

function feh_browser
    sh /home/effi/dotfiles/scripts/feh_browser.sh $argv -F -Z
end

function mcd
    mkdir -p $argv
    cd $argv
end

function x
    switch (echo $argv)
	    case '*.zip'
		unzip $argv
	    case '*.tar.bz2'
		tar xjf $argv
	    case '*.tar.gz'
		tar xzf $argv
	    case '*.bz2'
		bunzip2 $argv
	    case '*.rar'
		unrar x $argv
	    case '*.gz'
		gunzip $argv
	    case '*.tar'
		tar xf $argv
	    case '*.tbz2'
		tar xjf $argv
	    case '*.tgz'
		tar xzf $argv
	    case '*.Z'
		uncompress $argv
	    case '*.7z'
		7z x $argv
	    case '*'
		echo "Cannot extract file"
    end
end

function twitch
    mpv https://www.twitch.tv/$argv[1] --ytdl-format=$argv[2]
end

function ssht
    ssh $argv[1] -t tmux a -t $argv[2]
end

function reload
    source ~/.config/fish/config.fish
end

function please
    sudo $history[1]
end

function enable
    sudo ln -s /etc/sv/$argv[1] /var/service/
end

function sudo
    if test "$argv" = !!
	eval command sudo $history[1]
else
    command sudo $argv
end
end

function mm
    mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch10:"$argv"
end


# start X at login
#if status --is-login
#    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
#	exec startx -- -keeptty
#end
#if test -z "$DISPLAY" -a $XDG_VTNR -eq 2
#    nvidia-xrun
#end
#end

function goodnight
    sudo ~/./backlight -s 1
    sleep 1h
    poweroff
end


function win_reboot
    sudo efibootmgr -n 0000
    reboot
end
