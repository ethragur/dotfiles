#!/bin/bash
source ~/.cache/wal/colors.sh
echo -e "  $(free -h | grep Mem | awk '{print $7;}')\n\n$color7"

