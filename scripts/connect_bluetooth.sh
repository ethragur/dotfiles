#!/bin/bash


pkill pulseaudio
echo -e 'power on\nconnect 20:9B:A5:64:B7:09\n' | bluetoothctl
