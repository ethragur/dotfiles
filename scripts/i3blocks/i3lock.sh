echo -e " \n\n$color3\n"

if [ "$BLOCK_BUTTON" = "1" ]
then 
	scrot /tmp/screenshot.png
	convert /tmp/screenshot.png -blur 0x5 /tmp/screenshotblur.png
	i3lock -i /tmp/screenshotblur.png
fi
