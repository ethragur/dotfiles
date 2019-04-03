#!/usr/bin/bash

brightloc="/sys/class/backlight/amdgpu_bl0/brightness"
current=$(cat $brightloc)
max=$(cat /sys/class/backlight/amdgpu_bl0/max_brightness)
currentpc=$(echo "scale=2;($current / $max) " | bc -l | sed 's/\.//')
tenp=$(echo "$max / 20" | bc )


while getopts dil option
do
	case "${option}" in
		d) echo "$current - $tenp" | bc | xargs printf "%d\n0" | sort -gr | head -n1 | sudo tee $brightloc ;;
		i) echo "$current + $tenp" | bc | xargs printf "%d\n$max" | sort -g | head -n1 | sudo tee $brightloc ;;
		l) echo -e "  $currentpc%\n\n$color15" ;;
	esac
done

case $BLOCK_BUTTON in
	4) echo "$current + $tenp" | bc | xargs printf "%d\n$max" | sort -g | head -n1 | sudo tee $brightloc ;;
	5) echo "$current - $tenp" | bc | xargs printf "%d\n0" | sort -gr | head -n1 | sudo tee $brightloc ;;
esac
