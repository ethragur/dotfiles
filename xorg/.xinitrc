if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile



eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

xset -dpms s off
xrdb -load $DOTFILES/xorg/Xresources

start-pulseaudio-x11 &

export PRIMARY_SCREEN="$(xrandr | grep ' connected primary' | awk '{ print $1 }')"
export SECONDARY_SCREEN="$(xrandr | grep ' connected ' | awk 'FNR==2{ print $1 }')"
wal -Rn
exec i3 -c $DOTFILES/i3/config
