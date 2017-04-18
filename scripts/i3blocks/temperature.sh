#!/bin/bash
echo -e "  $(cat /sys/class/thermal/thermal_zone1/temp | awk '{print $1/1000}')°\n\n$color12\n"
