alias ls 'ls --color=auto'
alias ll 'ls -l --color=auto'
alias la 'ls -l -a --color=auto'
alias inst 'yaourt -S'
alias uinst 'sudo pacman -Rsnc'
alias i3conf 'vim ~/.i3/config'
alias cddot 'cd ~/dotfiles/'
alias givepw 'base64 /dev/urandom | head -c 10'
alias yolo 'yaourt -Syua --force --devel --noconfirm'
alias vim 'nvim'
alias rsync 'rsync -a --stats --progress'
alias goodnight 'sleep 1h; and poweroff' 
alias ccmake 'cmake .; and make'
set EDITOR nvim
set VISUAL nvim
set WINEDEBUG -all
set WINEPREFIX /home/effi/.wine/

set PATH /usr/bin/ /usr/local/bin/ /usr/local/sbin /usr/sbin/ /usr/bin/core_perl/

# declare solarize colors
#set u_col0 "#002b36"
#set u_col1 "#657b83"
#set u_col2 "#073642"
#set u_col3 "#dc322f"
#set u_col4 "#859900"
#set u_col5 "#b58900"
#set u_col6 "#268bd2"
#set u_col7 "#d33682"
#set u_col8 "#2aa198"
#set u_col9 "#eee8d5"
#set u_cola "#cb4b16"
#set u_colb "#586e75"
#set u_colc "#839496"
#set u_cold "#6c71c4"
#set u_cole "#93a1a1"
#set u_colf "#fdf6e3"

set color0 "#282828"
set color8 "#928374"
set color1 "#cc241d"
set color9 "#fb4934"
set color2 "#98971a"
set color3 "#d79921"
set color4 "#458588"
set color5 "#b16286"
set color6 "#689d6a"
set color7 "#a89984"
set color11 "#fabd2f"
set color12 "#83a598"
set color13 "#d3869b"
set color14 "#8ec07c"
set color15 "#ebdbb2"
set color10 "#b8bb26"

set red $color1
set yellow $color3
set black $color0
set green $color10
set white $color15
set blue $color4
set cyan $color12
set grey $color8
set purple $color13
set aqua $color14

set TERMINAL termite
set WINEARCH win64 
set fish_greeting ""

eval (dircolors -c ~/.dircolors | sed 's/>&\/dev\/null$//')


set LD_PRELOAD "libpthread.so.0 libGL.so.1"
set __GL_THREADED_OPTIMIZATIONS 1

fish_vi_mode

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
			7x x $argv	
		case '*'
			echo "Cannot extract file"
	end
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
#if status --is-login
#    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
##        exec startx -- -keeptty
#    end
#end



# Path to Oh My Fish install.
set -gx OMF_PATH /home/effi/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /home/effi/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -g theme_display_user yes


function fish_mode_prompt
# Do nothing if not in vi mode
  if set -q __fish_vi_mode
    switch $fish_bind_mode
      case default
	    prompt_segment $grey $green "N"
      case insert
	    prompt_segment $grey $white "I"
      case replace-one
	    prompt_segment $grey $red "R"
      case visual
	    prompt_segment $grey $purple "V"
    end
  end
end
