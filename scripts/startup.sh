#!/usr/bin/bash

pkill polybar
pkill picom

~/dotfiles/scripts/display.sh && feh --bg-fill "$(< "${HOME}/.cache/wal/wal")" 
MONITOR=$PRIMARY_SCREEN polybar --reload primary & 
MONITOR=$SECONDARY_SCREEN polybar --reload secondary &

sleep 0.2s && picom --experimental-backends --config ~/dotfiles/picom/picom.conf
