#!/bin/bash
source ~/.cache/wal/colors.sh
echo -e "  $(cat /sys/class/thermal/thermal_zone0/temp | awk '{print $1/1000}')°\n\n$color12"
