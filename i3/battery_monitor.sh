#!/bin/env bash

run_directory=/home/taytek/.config/i3

if test -f $run_directory/pids/battery_monitor.pid; then
	if $(kill -s 0 `cat $run_directory/pids/battery_monitor.pid` &>/dev/null); then
		echo "battery_monitor.sh is already running at pid $(cat $run_directory/pids/battery_monitor.pid)"
		exit 1
	fi
fi

called=0
echo -n $$ > $run_directory/pids/battery_monitor.pid

percent_cap=10

while true; do
	battery=$(cat /sys/class/power_supply/BAT*/capacity)
	if [ $battery -lt $percent_cap -a $called -ne 1 ]; then
		/home/taytek/.config/i3/notif.sh battery
		called=1
	elif [ $battery -gt $percent_cap ]; then
		called=0
	fi
	sleep 30
done
