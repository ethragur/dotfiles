#! /bin/bash

PRIMARY=$(xrandr | grep connected | awk '{print $1;}' | grep HDMI)
EXT1=$(xrandr | grep connected | awk '{print $1;}' | grep VGA)


if ( xrandr | grep "$EXT1 connected"); then
	xrandr --output $PRIMARY --primary --auto --output $EXT1 --auto --left-of $PRIMARY
	echo "$EXT1 & $PRIMARY enabled"
else
	xrandr --output $EXT1 --off
	xrandr --output $PRIMARY --primary --auto
	echo "$PRIMARY enabled"
fi

