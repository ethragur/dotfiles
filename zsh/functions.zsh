function twitch() {
	if [ "$1" != "" ] # or better, if [ -n "$1" ]
	then
		if [ "$2" != "" ]
		then
			livestreamer https://twitch.tv/$1 $2 --player=$PLAYER
		else
			livestreamer https://twitch.tv/$1 high --player=$PLAYER
		fi
	else
		echo "Usage: twitch [channelname] [quality]"
	fi
}


function renew_colorscheme() {
	source $DOTFILES/zsh/colors.zsh
	rm $DOTFILES/xorg/current.xcolors 2> /dev/null
	touch $DOTFILES/xorg/current.xcolors
	echo "#define BG $color0" >> $DOTFILES/xorg/current.xcolors
	echo "#define FG $color15" >> $DOTFILES/xorg/current.xcolors
	echo "#define TP $transparent" >> $DOTFILES/xorg/current.xcolors
	sed -i "s/background = .*/background = $color0/g" $DOTFILES/termite/config
	sed -i "s/foreground = .*/foreground = $color15/g" $DOTFILES/termite/config
	sed -i "s/foreground_bold = .*/foreground_bold = $color15/g" $DOTFILES/termite/config

	for i in {0..15};
	do
		a="color$i";
		col=$(eval "echo \$$a");
		echo "#define C$i $col" >> $DOTFILES/xorg/current.xcolors;
		sed -i "s/color$i = .*/color$i = $col/g" $DOTFILES/termite/config
	done
}
