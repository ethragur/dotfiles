#!/usr/bin/bash
source ~/.cache/wal/colors.sh
ponymix is-muted
if [ $? -eq 0 ]
then
	echo -e "MUTED \n\n$color1"
else
	echo -e "$(ponymix get-volume)%\n\n$color1"
fi

case $BLOCK_BUTTON in
	1) ( pavucontrol & ) && disown ;;
	3) ponymix toggle && pkill -RTMIN+17 i3blocks ;;
	4) ponymix increase 5 && pkill -RTMIN+17 i3blocks ;;
	5) ponymix decrease 5 && pkill -RTMIN+17 i3blocks ;;
esac

