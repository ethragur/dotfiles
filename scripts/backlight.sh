#!/usr/bin/bash


cd /sys/class/backlight/amdgpu_bl0/; 
m=$(cat max_brightness); 
c=$(cat brightness); 
if [ "$1" == "-i" ]; then
	n=$(($c + ($m/12)))
else
	n=$(($c - ($m/12)))
fi
echo $n > brightness
