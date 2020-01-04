#!/bin/bash

rofi_command="rofi -theme powermenu-theme.rasi"

### Options ###
power_off="    "
reboot="    "
lock="    "
log_out="    "
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        sleep .5
        sudo poweroff
        ;;
    $reboot)
        sleep .5
        sudo reboot
        ;;
    $lock)
        ;;
    $log_out)
        i3-msg exit
        ;;
esac


