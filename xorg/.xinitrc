xset -dpms s off
xset r rate 200 50
xrdb -load $DOTFILES/xorg/Xresources

session=${1:-std}

case $session in
	std				) exec i3 -c $DOTFILES/i3/config;;
	nvidia			) exec nvidia-xrun i3 -c $DOTFILES/i3/config;;
	*) exec $1;;
esac
