#!/usr/bin/bash
# choose pulseaudio sink via rofi or dmenu
# changes default sink and moves all streams to that sink

application=$(ponymix list -t source-output --short | awk '{$1=""; print $0}' | $1 -p "Applications:" | awk '{print $1}') &&
output=$(ponymix -t source list | awk '/^source/ {s=$1" "$2;getline;gsub(/^ +/,"",$0);print s" "$0}' | $1 -p "To Input:" |grep -Po '[0-9]+(?=:)')  &&

ponymix -t source-output -d $application move $output
