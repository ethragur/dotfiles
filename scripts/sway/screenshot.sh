#!/usr/bin/bash


OUTPUT="$HOME/Documents/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S.png')"
GRIM=$(which grim)

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
		OUTPUT=" - | wl-copy"
      ;;
    h ) 
      ;;
    \? ) exit 1
      ;;
  esac
done

OPTION=""

if [ "$REGION" = true ]; then
	OPTION=" -g '$(slurp)'"
fi

if [ "$FOCUSED" = true ]; then
	OPTION=" -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')" 
fi

if [ "$WINDOW" = true ]; then
	OPTION=" -g '"
	OPTION+=$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)
	OPTION+="'"
fi

eval "$GRIM $OPTION $OUTPUT"
