alias ls 'ls --color=auto'
alias ll 'ls -l --color=auto'
alias la 'ls -l -a --color=auto'
alias inst 'yaourt -S'
alias uinst 'sudo pacman -Rsnc'
alias i3conf 'vim ~/.i3/config'
alias cddot 'cd ~/dotfiles/'
alias shutdown 'echo hahahahahahahaha'
alias givepw 'base64 /dev/urandom | head -c 10'
alias yolo 'yaourt -Syua --force --devel --noconfirm'
alias vim 'nvim'

set EDITOR nvim
set VISUAL nvim
set WINEDEBUG -all
set WINEPREFIX /home/effi/.wine/

set PATH /usr/bin/ /usr/local/bin/ /usr/local/sbin /usr/sbin/ /usr/bin/core_perl/


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
end



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
        set_color --background brown black
        echo ' N '
      case insert
        set_color --background brown white
        echo ' I '
      case replace-one
        set_color --background brown black
        echo ' R '
      case visual
        set_color --background brown blue
        echo ' V '
    end
    set_color brown --background black
    echo ''
  end
end

