#!/usr/bin/bash


DEVICE="$(ip addr show | grep enp | tail -n 1 | awk '{print $7;}')"
read rx < "/sys/class/net/$DEVICE/statistics/rx_bytes"
read tx < "/sys/class/net/$DEVICE/statistics/tx_bytes"

sleep 1s

read rxo < "/sys/class/net/$DEVICE/statistics/rx_bytes"
read txo < "/sys/class/net/$DEVICE/statistics/tx_bytes"


rspeed=$(( ($rxo - $rx ) / 1000 ))
tspeed=$(( ($txo - $tx ) / 1000 ))

echo -e "${rspeed}K ${tspeed}K\n\n$color9\n"
