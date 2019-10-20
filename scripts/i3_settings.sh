#!/usr/bin/bash

DMENU="dmenu -i -x 1320 -y 830 -l 9 -h 50 -w 1000 -p > -nf $color15 -nb $color0 -sb $color0 -sf $color7 -o 0.8 -dim 0.1 -dc $color0 -fn 'Hack-16'"
ACTION="$(printf "Audio Options\ni3 Options\nSystem Options\nGoodnight\nBack\n" | $DMENU $*)"


if [ "$ACTION" == "System Options" ]
then
	ACTION="$(printf "Do Nothing\nScreensaver\nExit i3\nLogout\nReboot\nPoweroff\n" | $DMENU $*)"
	if [ "$ACTION" == "Screensaver" ]
	then
		sh ~/dotfiles/scripts/i3lock.sh
	elif [ "$ACTION" == "Exit i3" ]
	then
		i3-msg exit
	fi
elif [ "$ACTION" == "Audio Options" ]
then
	ACTION="$(printf "Change Default Output\nChange Application Output\nChange Default Input\nChange Application Input\nBack\n" | $DMENU $*)"
	if [ "$ACTION" == "Change Default Output" ]
	then
		sh ~/dotfiles/scripts/settings/pulse_change_default_output.sh "$DMENU"
	elif [ "$ACTION" == "Change Application Output" ]
	then
		sh ~/dotfiles/scripts/settings/pulse_change_application_output.sh "$DMENU"
	elif [ "$ACTION" == "Change Application Input" ]
	then
		sh ~/dotfiles/scripts/settings/pulse_change_application_input.sh "$DMENU"
	fi
elif [ "$ACTION" == "i3 Options" ]
then
	ACTION="$(printf "Reload Config\nRestart i3\nBack\n" | $DMENU $*)"
	if [ "$ACTION" == "Reload Config" ]
	then
		i3-msg reload
	elif [ "$ACTION" == "Restart i3" ]
	then
		i3-msg restart
	fi
fi

