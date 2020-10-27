#!/usr/bin/bash

pkill polybar
pkill picom

feh --bg-fill "$(< "${HOME}/.cache/wal/wal")" &

polybar --list-monitors | while read m; 
do 
	mon=$(echo $m | cut -d":" -f1)
	if echo $m | grep -q "primary"; then
		MONITOR=$mon polybar --reload primary &
	else
		MONITOR=$mon polybar --reload secondary &
	fi
done

picom --experimental-backends --config ~/dotfiles/picom/picom.conf
