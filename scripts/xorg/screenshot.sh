#!/usr/bin/bash


OUTPUT="$HOME/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S.png')"
MAIM=$(which maim)

while getopts "rwdhc" opt; do
  case ${opt} in
    r ) 
		REGION=true
      ;;
    w ) 
		WINDOW=true
      ;;
    d ) 
		FOCUSED=true
      ;;
    c )
		OUTPUT=" | xclip -selection clipboard -t image/png "
      ;;
    h ) 
      ;;
    \? ) exit 1
      ;;
  esac
done

OPTION=""

if [ "$REGION" = true ]; then
  OPTION=" -g $(slop) "
fi

if [ "$FOCUSED" = true ]; then
	OPTION=" -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')" 
fi

if [ "$WINDOW" = true ]; then
	OPTION=" -i $(xdotool getactivewindow) "
fi

eval "$MAIM $OPTION $OUTPUT"
