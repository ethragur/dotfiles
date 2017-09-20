#!/usr/bin/bash
# choose pulseaudio sink via rofi or dmenu
# changes default sink and moves all streams to that sink

application=$(ponymix list -t sink-input --short | awk '{$1=""; print $0}' | $1 -p "Applications:" | awk '{print $1}') &&
sink=$(ponymix -t sink list|awk '/^sink/ {s=$1" "$2;getline;gsub(/^ +/,"",$0);print s" "$0}'| $1 -p "To Output:" |grep -Po '[0-9]+(?=:)')  &&

ponymix -t sink-input -d $application move $sink
