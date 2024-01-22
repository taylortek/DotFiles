#!/bin/env bash

current=`xrandr --verbose | awk '/Brightness/ { print $2; exit }'`

xrandr --output eDP --brightness $(echo "$current $1" | awk '{print $1 + $2}')
