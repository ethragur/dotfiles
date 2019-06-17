#!/bin/bash
TMPBG=/tmp/screen.png
RES=3840x1080
 
ffmpeg -f x11grab -y -video_size $RES -i $DISPLAY -filter_complex "boxblur=5:1" -vframes 1 $TMPBG
i3lock -i $TMPBG
