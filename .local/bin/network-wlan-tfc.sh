#!/bin/sh

wlan_card='wlp2s0'

wlanmon_card=$(ip a s | grep $wlan_card'mon' | awk 'NR%1==0 {print $2}' | sed 's/://g')
if [ $wlanmon_card ]; then
    printf " MONITOR"
fi

wlan_online=$(iw $wlan_card link | grep 'Connected' | awk 'NR%1==0 {print $1}')
wlan_offline=$(iw $wlan_card link | grep 'Not' | awk 'NR%1==0 {print $1}')
internet=$(wget -qO- ifconfig.co)
internet_logo=""
if [ $internet ]; then
    internet_logo=" "
else
    internet_logo=" "
fi

if [ $wlan_online ]; then
    wlan_do=$(ifstat2 -i $wlan_card 1 1 | awk 'NR%3==0 {print $1}')
    wlan_up=$(ifstat2 -i $wlan_card 1 1 | awk 'NR%3==0 {print $2}')
    printf "$internet_logo %5s  %5s\\n" \
    $(numfmt --to=none $wlan_do) \
    $(numfmt --to=none $wlan_up)
elif [ $wlan_offline ];then
    printf " OFFLINE"
else
    printf " NOADPTR"
fi
