#!/bin/zsh

export color0="#282828"
export color8="#928374"
export color1="#cc241d"
export color9="#fb4934"
export color2="#98971a"
export color3="#d79921"
export color4="#458588"
export color5="#b16286"
export color6="#689d6a"
export color7="#a89984"
export color11="#fabd2f"
export color12="#83a598"
export color13="#d3869b"
export color14="#8ec07c"
export color15="#ebdbb2"
export color10="#b8bb26"
export transparent="#28282828"


renew_colorscheme() {
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
