#!/bin/bash
TMPBG=/tmp/screenlock.png
RES=$(xrandr | grep 'Screen 0:' | awk '{print $8"x"$10}' | sed 's/.$//')
 
ffmpeg -f x11grab -y -video_size $RES -i $DISPLAY -filter_complex "boxblur=5:1" -vframes 1 $TMPBG
i3lock -i $TMPBG
