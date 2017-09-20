#! /bin/bash

PRIMARY=$(xrandr | grep connected | awk '{print $1;}' | grep DisplayPort)
EXT1=$(xrandr | grep connected | awk '{print $1;}' | grep HDMI)


if ( xrandr | grep "$EXT1 connected"); then
	xrandr --output $PRIMARY --primary --auto 
	xrandr --output $EXT1 --auto --right-of $PRIMARY --panning 3840x2160+3840+0 --scale 1.7x1.7
	echo "$EXT1 & $PRIMARY enabled"
else
	xrandr --output $EXT1 --off
	xrandr --output $PRIMARY --primary --auto
	echo "$PRIMARY enabled"
fi

