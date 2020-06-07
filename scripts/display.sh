#!/usr/bin/bash
# Author Stefan Kuhnert
# if you have an window manager running you have to restart it
# at the bottom are the full queries for left and right

scale_factor="1.2"
primary="DisplayPort-2"
primary_xres="3840"
primary_yres="2160"

sec=$SECONDARY_SCREEN
sec_xres="1920"
sec_yres="1080"
sec_pos="left"

scaled_x=$(echo $sec_xres $scale_factor | awk '{printf "%d", $1 * $2}' )
scaled_y=$(echo $sec_yres $scale_factor | awk '{printf "%d", $1 * $2}' )

fbx=$(echo "$primary_xres $scaled_x" | awk '{printf "%d", $1 + $2}' )
fby=$(echo "$primary_yres $scaled_y" | awk '{printf "%d", $1 + $2}' )



query=$(echo $fbx $fby | awk '{printf "xrandr --fb %dx%d", $1, $2}')
primary_q=$(echo $primary $primary_xres $primary_yres | awk '{printf "--output %s --primary --mode %dx%d", $1, $2, $3}')
sec_q=$(echo $sec $scale_factor | awk '{printf "--output %s --scale %sx%s", $1, $2, $2}')

if [ $sec_pos == "right" ]
then
	pos_sec=$(echo $primary_xres | awk '{printf "--pos %dx0", $1}')
	panning=$(echo $scaled_x $scaled_y $primary_xres | awk '{printf "--panning %dx%d+%d+0", $1, $2, $3}')
	sec_q="$sec_q $pos_sec $panning"
elif [ $sec_pos == "left" ]
then
	pos_prim=$(echo $scaled_x | awk '{printf "--pos %dx0", $1}')
	primary_q="$primary_q $pos_prim"
	panning=$(echo $scaled_x $scaled_y | awk '{printf "--panning %dx%d+0+0", $1, $2}')
	sec_q="$sec_q $panning"
fi

query="$query $primary_q $sec_q"

$query
	
#query=$(echo $fbx $fby $primary $primary_xres $primary_yres $sec $primary_xres $scaled_x $scaled_y $primary_xres $scale_factor $scale_factor $sec_pos $primary | \
#	awk '{printf "xrandr --fb %dx%d --output %s --mode %dx%d --output %s --pos %dx0 --panning %dx%d+%d+0 --scale %sx%s --%s-of %s", $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14}' )
#
#queryl=$(echo $fbx $fby $primary $primary_xres $primary_yres $scaled_x $sec $scaled_x $scaled_y $scale_factor $scale_factor $sec_pos $primary | \
#	awk '{printf "xrandr --fb %dx%d --output %s --mode %dx%d --pos %dx0 --primary --output %s --panning %dx%d+0+0 --scale %sx%s ", $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14}' )
