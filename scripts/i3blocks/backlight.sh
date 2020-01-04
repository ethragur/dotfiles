#!/usr/bin/bash

source ~/.cache/wal/colors.sh

brightloc="/sys/class/backlight/amdgpu_bl0/brightness"
current=$(cat $brightloc)
max=$(cat /sys/class/backlight/amdgpu_bl0/max_brightness)
currentpc=$(echo "scale=2;($current / $max) " | bc -l | sed 's/\.//')
# this could propably be done with some kind of logarithmic expression... but it's midnight
if [ "$currentpc" -lt "10" ]; then
	tenp=$(echo "$max / $max" | bc )
elif [ "$currentpc" -lt "30" ]; then
	tenp=$(echo "$max / ($max / 2)" | bc )
elif [ "$currentpc" -lt "70" ]; then
	tenp=$(echo "$max / ($max / 8)" | bc )
elif [ "$currentpc" -le "100" ]; then
	tenp=$(echo "$max / ($max / 16)" | bc )
fi

case $BLOCK_BUTTON in
	1) if [ $currentpc -eq 0 ]; then echo "$max"; else echo "0"; fi | sudo tee $brightloc > /dev/null ;;
	4) echo "$current + $tenp" | bc | xargs printf "%d\n$max" | sort -g | head -n1 | sudo tee $brightloc > /dev/null ;;
	5) echo "$current - $tenp" | bc | xargs printf "%d\n0" | sort -gr | head -n1 | sudo tee $brightloc > /dev/null ;;
esac

current=$(cat $brightloc)
max=$(cat /sys/class/backlight/amdgpu_bl0/max_brightness)
currentpc=$(echo "scale=2;($current / $max) " | bc -l | sed 's/\.//')

while getopts dil option
do
	case "${option}" in
		d) echo "$current - $tenp" | bc | xargs printf "%d\n0" | sort -gr | head -n1 | sudo tee $brightloc ;;
		i) echo "$current + $tenp" | bc | xargs printf "%d\n$max" | sort -g | head -n1 | sudo tee $brightloc ;;
		l) echo -e "  $currentpc%\n\n$color15" ;;
	esac
done

