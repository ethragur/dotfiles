#!/bin/bash
batinf='acpi -b'
perc=$(acpi -b | awk '{print $4;}' | sed 's/%//g' | sed 's/,//g')

if [ $perc > '75' ]
then echo "  $perc%"
elif [ $perc > '50' ]
then echo "  $perc%"
elif [ $perc > '25' ]
then echo "  $perc%"
elif  $perc > '10' ]
then echo "  $perc%"
else
echo "  $perc%"
fi






