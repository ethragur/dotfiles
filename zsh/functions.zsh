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

function g () {
	if [[ -n "$1" ]]
	then
		git $@
	else
		git status
	fi
}

# Complete g like git
compdef g=git

function mcd () {
	mkdir $1
	cd $1
}

function cls () {
	cd $1
	ls
}

function extract {
	if [ -z "$1" ]; then
		# display usage if no parameters given
		echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
	else
		if [ -f $1 ] ; then
			# NAME=${1%.*}
			# mkdir $NAME && cd $NAME
			case $1 in
				*.tar.bz2)   tar xvjf $1    ;;
				*.tar.gz)    tar xvzf $1    ;;
				*.tar.xz)    tar xvJf $1    ;;
				*.lzma)      unlzma $1      ;;
				*.bz2)       bunzip2 $1     ;;
				*.rar)       unrar x -ad $1 ;;
				*.gz)        gunzip $1      ;;
				*.tar)       tar xvf $1     ;;
				*.tbz2)      tar xvjf $1    ;;
				*.tgz)       tar xvzf $1    ;;
				*.zip)       unzip $1       ;;
				*.Z)         uncompress $1  ;;
				*.7z)        7z x $1        ;;
				*.xz)        unxz $1        ;;
				*.exe)       cabextract $1  ;;
				*)           echo "extract: '$1' - unknown archive method" ;;
			esac
		else
			echo "$1 - file does not exist"
		fi
	fi
}
