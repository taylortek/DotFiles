#!/bin/env bash

status_id=2345

case $1 in
	brightness)
		brightness=$(printf %.0f $(echo `cat /sys/class/backlight/amdgpu_bl0/brightness`/255*100 | bc -l))

		dunstify "Brightness ($brightness%)" -h int:value:$brightness -r $status_id -u low
		;;
	gamma)
		gamma=$(xrandr --verbose | awk '/Brightness/ { print $2; exit }')

		dunstify "Gamma $gamma" -r $status_id -u low
		;;
	battery)
		battery=$(($(cat /sys/class/power_supply/BAT*/capacity)+1))

		dunstify "Battery at ($battery%)" -h int:value:$battery -r $status_id -u normal
		;;
	class)
		class=$(/home/taytek/.config/i3/getnextbell.sh)

		dunstify "$class" -r $status_id -u normal
		;;
esac
