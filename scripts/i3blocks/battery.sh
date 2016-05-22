#!/bin/bash
batinf='acpi -b'
perc=$(acpi -b | awk '{print $4;}' | sed 's/%//g' | sed 's/,//g')

if (( $perc > '75' ))
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



