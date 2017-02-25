alias ls 'ls --color=auto'
alias ll 'ls -l --color=auto'
alias la 'ls -l -a --color=auto'

alias .. 'cd ..'
alias ... 'cd ../../'
alias .... 'cd ../../../'

alias netstat 'ping 8.8.8.8'
alias wget 'wget -c'
alias mkdir 'mkdir -pv'
alias dd 'dd status=progress'

alias inst 'pacaur -S'
alias install 'pacaur -S'
alias uinst 'pacaur -Rsnc'
alias uninstall 'pacaur -Rsnc'
alias update 'sudo pacman -Syu; and pacaur -Sua'
alias search 'pacaur -Ss'
alias searchr 'pacman -Ss'

alias sysen 'sudo systemctl enable --now'
alias sysdis 'sudo systemctl disable --now'
alias sysstart 'sudo systemctl start'
alias sysstop 'sudo systemctl stop'
alias sysstat 'sudo systemctl status'

alias i3conf "vim $DOTFILES/i3/config"
alias cddot "cd $DOTFILES"
alias cddev "cd ~/Documents/dev"
alias givepw 'base64 /dev/urandom | head -c 32'
alias reload 'source ~/.zshrc'
alias rsync 'rsync -a --stats --progress'
alias ccmake 'cmake .; and make'

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

set -gx vblank_mode 0
set -gx VGL_READBACK pbo


set PATH /usr/bin/ /usr/local/bin/ /usr/local/sbin /usr/sbin/ /usr/bin/core_perl/

set -gx color0  "#fbf1c7"
set -gx color8  "#928374"
set -gx color1  "#cc241d"
set -gx color9  "#9d0006"
set -gx color2  "#98971a"
set -gx color10 "#79740e"
set -gx color3  "#d79921"
set -gx color11 "#b57614"
set -gx color4  "#458588"
set -gx color12 "#976678"
set -gx color5  "#b16286"
set -gx color13 "#8f3f71"
set -gx color6  "#689d6a"
set -gx color14 "#427b58"
set -gx color7  "#7c6f64"
set -gx color15 "#3c3836"

set -gx TERMINAL st 
set -gx WINEARCH win64 
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

function reload
	source ~/.config/fish/config.fish
end

function please
	sudo $history[1]
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
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 2
        nvidia-xrun
    end
end

function goodnight
	sudo ~/./backlight -s 1
	sleep 1h
	poweroff
end
	

function win_reboot
	sudo efibootmgr -n 0000
	reboot
end
