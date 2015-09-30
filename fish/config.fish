alias ls 'ls --color=auto'
alias nani 'livestreamer http://www.twitch.tv/naniwasc2 high'
alias ll 'ls -l --color=auto'
alias la 'ls -l -a --color=auto'
alias inst 'sudo yaourt -S'
alias uinst 'sudo pacman -Rsnc'
alias i3conf 'vim ~/.i3/config'
alias battlenet 'wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Battle.net/Battle.net\ Launcher.exe'
alias cddot 'cd ~/dotfiles/'
alias shutdown 'echo hahahahahahahaha'

set EDITOR vim
set VISUAL vim
set WINEDEBUG -all
set WINEPREFIX /home/effi/.wine/

set PATH /usr/bin/ /usr/local/bin/ /usr/local/sbin /usr/sbin/ 


set TERMINAL termite
set WINEARCH win64 
set fish_greeting ""

eval (dircolors -c ~/.dircolors | sed 's/>&\/dev\/null$//')


set LD_PRELOAD "libpthread.so.0 libGL.so.1"
set __GL_THREADED_OPTIMIZATIONS 1

fish_vi_mode


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
