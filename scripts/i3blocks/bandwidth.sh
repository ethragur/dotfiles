#!/bin/sh

read rx < "/sys/class/net/$1/statistics/rx_bytes"
read tx < "/sys/class/net/$1/statistics/tx_bytes"

sleep 1s

read rxo < "/sys/class/net/$1/statistics/rx_bytes"
read txo < "/sys/class/net/$1/statistics/tx_bytes"


rspeed=$(( ($rxo - $rx ) / 1000 ))
tspeed=$(( ($txo - $tx ) / 1000 ))

echo ${rspeed}K  ${tspeed}K
