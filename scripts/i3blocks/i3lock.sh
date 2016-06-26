echo -e " \n\n$color3\n"

if [ "$BLOCK_BUTTON" = "1" ]
then 
	scrot /tmp/screenshot.bmp
	convert /tmp/screenshot.bmp -resize 10% /tmp/screenshotnoise.png
	convert /tmp/screenshotnoise.png -blur 0x1 -resize 1000% /tmp/screenshotblur.png
	i3lock -i /tmp/screenshotblur.png
fi
