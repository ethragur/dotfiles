if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export DESKTOP_SESSION=gnome

xset -dpms s off
xrdb -load $DOTFILES/xorg/Xresources


start-pulseaudio-x11 &
exec i3 -c $DOTFILES/i3/config
#exex lxqt-session
##exec awesome
