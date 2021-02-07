#!/bin/sh

icon=""
mem_total=$(free -m | awk 'NR%2==0 {print $2}')
mem_avail=$(free -m | awk 'NR%2==0 {print $7}')
mem_used=$(( $mem_total - $mem_avail ))
mem_usage=$(( $mem_used * 100 / $mem_total ))
if [ $mem_usage -ge 80 ]; then
    printf "$icon ${mem_usage//%}!"
else
    printf "$icon ${mem_usage//%}"
fi
