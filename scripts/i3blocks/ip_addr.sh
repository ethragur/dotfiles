#!/bin/bash
source ~/.cache/wal/colors.sh
DEVICE="$(ip route | awk '/default/ {print $5}' | head -n 1)"
echo -e "$(ip -o -4 addr show up primary scope global | grep $DEVICE | awk '{print $4;}' | rev | cut -c 4- | rev)\n\n$color3"
