#!/usr/bin/bash

source ~/.cache/wal/colors.sh

DEVICE="$(ip route | awk '/default/ {print $5}' | head -n 1)"
read rx < "/sys/class/net/$DEVICE/statistics/rx_bytes"
read tx < "/sys/class/net/$DEVICE/statistics/tx_bytes"

sleep 1s

read rxo < "/sys/class/net/$DEVICE/statistics/rx_bytes"
read txo < "/sys/class/net/$DEVICE/statistics/tx_bytes"


rspeed=$(( ($rxo - $rx ) / 1024 ))
tspeed=$(( ($txo - $tx ) / 1024 ))

echo -e "${rspeed}K ${tspeed}K\n\n$color9"
