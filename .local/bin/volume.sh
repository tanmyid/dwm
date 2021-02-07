#!/bin/sh

# PulseAudio
ou_mute=$(pamixer --get-mute)
in_mute=$(pamixer --source 1 --get-mute)
ou_vol=$(pamixer --get-volume)
in_vol=$(pamixer --source 1 --get-volume)
jack_stat=$($HOME/.local/bin/has_headphone)

if   [ $jack_stat = "yes" ]; then
    icon_ou_on=""
    icon_ou_off=""
elif [ $jack_stat = "no"  ]; then
    icon_ou_on=""
    icon_ou_off=""
fi
icon_in_on=""
icon_in_off=""

if   ([ $ou_mute = "true"  ] || [ $ou_mute = "off" ]) && ([ $in_mute = "true"  ] || [ $in_mute = "off" ]); then
    printf "$icon_ou_off Ø $icon_in_off Ø"
elif ([ $ou_mute = "true"  ] || [ $ou_mute = "off" ]) && ([ $in_mute = "false" ] || [ $in_mute = "on"  ]); then
    printf "$icon_ou_off Ø $icon_in_on $in_vol"
elif ([ $ou_mute = "false" ] || [ $ou_mute = "on"  ]) && ([ $in_mute = "true"  ] || [ $in_mute = "off" ]); then
    printf "$icon_ou_on $ou_vol $icon_in_off Ø"
elif ([ $ou_mute = "false" ] || [ $ou_mute = "on"  ]) && ([ $in_mute = "false" ] || [ $in_mute = "on"  ]); then
    printf "$icon_ou_on $ou_vol $icon_in_on $in_vol"
else
    printf "$icon_ou_off ERROR"
fi
