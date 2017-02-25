if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xset -dpms s off
xrdb -load $DOTFILES/xorg/Xresources


exec i3 -c $DOTFILES/i3/config
##exec awesome
