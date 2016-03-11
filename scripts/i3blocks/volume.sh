#!/bin/bash
ponymix is-muted
if [ $? -eq 0 ]
	then echo -e "MUTED \n\n$color1" 
else
	echo -e "$(ponymix get-volume)% \n\n$color1"
fi

case $BLOCK_BUTTON in
	1) ( pavucontrol & ) && disown;;
	3) ponymix toggle ;;
	4) ponymix increase 5 ;;
	5) ponymix decrease 5 ;;
esac
