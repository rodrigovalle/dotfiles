#!/bin/bash

LAP="eDP1"  # name of the laptop monitor
AUX="DP1"   # name of the second monitor

if !(xrandr | egrep "$AUX disconnected"); then
	echo "monitor connected!"
	xrandr --output $LAP --auto --primary \
	       --output $AUX --auto --right-of $LAP
else
	echo "monitor disconnected!"
	xrandr --output $AUX --off
fi

sleep 1
~/.fehbg
