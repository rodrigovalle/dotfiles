#!/bin/bash

# note: there's a bug when booting with a monitor connected:
# bspwm will switch the order of monitor ^1 and ^2 so ^1 isn't 
# guaranteed to be the primary monitor all the time. Works fine
# if you connect the monitor after booting and then run this script
# though, because bspwm will set the laptop's monitor as primary
# because it has no other options.
#
# note: fixed by using $LAP directly :D

#set -e

#LAP=$(bspc query -M -m ^1)  # name of the laptop/primary monitor (eDP1)
#AUX=$(bspc query -M -m ^2)  # name of the second monitor (DP1)
LAP="eDP1"
AUX="DP1"

if (xrandr | egrep "^$AUX connected"); then
	xrandr --output $LAP --auto --primary \
	       --output $AUX --auto --right-of $LAP
	# send desktops 6 - 10 to the connected monitor
	for i in {6..10}; do
		# we use ^6 because the desktops get shifted back to fill
		# the "hole" left behind by removing the desktop from the monitor
		bspc desktop ^6 --to-monitor $AUX
	done
    # stick the dummy desktop at the end (new desktops are added to the end
    # of existing desktops)
    # need the dummy desktop when switching back to single monitor mode
	bspc monitor $AUX -o VI VII IIX IX X dummy

    sleep 0.01
    ~/.fehbg

else
	echo "external monitor not found"
    exit 1
fi
