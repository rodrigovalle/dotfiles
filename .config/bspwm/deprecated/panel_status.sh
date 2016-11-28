#!/bin/bash

clock()
{
	TIME=$(date "+%a %b %d")
	echo -n $TIME
}

day()
{
	DAY=$(date "+%R")
	echo -n $DAY
}

# TODO: fix this up a bit, maybe switch all of this over to python, it's nicer
volume()
{
    INFO=$(amixer sget -M Master PCH)
    $(echo $INFO | egrep -q "\[on\]" || return 1)
    MUTE=$?

    if [ $MUTE = 1 ]; then
        VOLUME="MM"
    else
        VOLUME=$(echo $INFO | egrep -o "[0-9]+%")
    fi

    echo -n "$VOLUME%"
}

battery()
{
	BATPERC=$(cat /sys/class/power_supply/BAT0/capacity)
	echo -n "$BATPERC%%"
}

#desktops()
#{
	# bspc subscribe report
	# see:
	# man bspc: report format
#}

# replace this loop with some event-based system to save battery
# see inotify api to detect changes in battery level
# volume change events can be triggered directly by the volume key
while true; do
	echo "%{r}bat: $(battery) | vol: $(volume) | $(day)  $(clock)"
    sleep 5
done
