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
alias givepw 'base64 /dev/urandom | head -c 10'
alias reload 'source ~/.zshrc'
alias rsync 'rsync -a --stats --progress'
alias goodnight 'sleep 1h; and poweroff' 
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

set -gx color0 "#282828"
set -gx color8 "#928374"
set -gx color1 "#cc241d"
set -gx color9 "#fb4934"
set -gx color2 "#98971a"
set -gx color3 "#d79921"
set -gx color4 "#458588"
set -gx color5 "#b16286"
set -gx color6 "#689d6a"
set -gx color7 "#a89984"
set -gx color11 "#fabd2f"
set -gx color12 "#83a598"
set -gx color13 "#d3869b"
set -gx color14 "#8ec07c"
set -gx color15 "#ebdbb2"
set -gx color10 "#b8bb26"

set -gx TERMINAL termite
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

source $DOTFILES/fish/private.fish
function twitch
	livestreamer --twitch-oauth-token $twitch_auth --player mpv https://www.twitch.tv/$argv[1] $argv[2] 
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

# start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 2
		nvidia-xrun openbox-session
    end
end

function win_reboot
	sudo efibootmgr -n 0000
	reboot
end
