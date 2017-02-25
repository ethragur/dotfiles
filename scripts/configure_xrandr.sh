#! /bin/bash

PRIMARY=$(xrandr | grep connected | awk '{print $1;}' | grep eDP)
EXT1=$(xrandr | grep connected | awk '{print $1;}' | grep HDMI)


if ( xrandr | grep "$EXT1 connected"); then
	xrandr --output $EXT1 --primary --auto --output $PRIMARY --set "Broadcast RGB" "Full" --auto --right-of $EXT1 
	echo "$EXT1 & $PRIMARY enabled"
else
	xrandr --output $EXT1 --off
	xrandr --output $PRIMARY --primary --auto
	echo "$PRIMARY enabled"
fi

