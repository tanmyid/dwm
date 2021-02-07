#!/bin/sh

cap=$(cat /sys/class/power_supply/BAT1/capacity)
if [ $cap -ge 0 ] && [ $cap -le 20 ]; then
    echo " " $cap"%"
elif [ $cap -ge 21 ] && [ $cap -le 40 ]; then
    echo " " $cap"%"
elif [ $cap -ge 41 ] && [ $cap -le 60 ]; then
    echo " " $cap"%"
elif [ $cap -ge 61 ] && [ $cap -le 90 ]; then
    echo " " $cap"%"
elif [ $cap -ge 91 ] && [ $cap -le 100 ]; then
    echo " " $cap"%"
else
    echo "UNKNWN"
fi
