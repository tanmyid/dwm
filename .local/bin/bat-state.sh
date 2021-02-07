#!/bin/sh

state=$(cat /sys/class/power_supply/BAT1/status)
if [ $state = "Charging" ]; then
    echo " " # charging
elif [ $state = "Discharging" ]; then
    echo " " # discharging
elif [ $state = "idle" ]; then
    echo " " # idle
else
    echo " " # unknown
fi
