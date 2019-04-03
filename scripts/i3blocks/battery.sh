#!/bin/bash
perc=$(cat /sys/class/power_supply/BAT*/capacity)
onpower=$(cat /sys/class/power_supply/ADP*/online) 

if (( $onpower == '1' ))
then echo -e "  $perc%\n\n$color10"
elif (( $perc > '75' ))
then echo -e "  $perc%\n\n$color10"
elif (( $perc > '50' ))
then echo -e "  $perc%\n\n$color10"
elif (( $perc > '25' ))
then echo -e "  $perc%\n\n$color10"
elif  (( $perc > '10' ))
then echo -e "  $perc%\n\n$color10"
else
echo -e "  $perc%\n\n$color10"
fi



