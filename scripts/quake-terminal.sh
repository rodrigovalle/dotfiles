#!/bin/zsh

cname='quake-term'

function toggle_padding {
    if [[ $(bspc config -m focused bottom_padding) != 15 ]]; then
        bspc config -m focused bottom_padding 15
    else
        bspc config -m focused bottom_padding 285
    fi
}
#trap toggle_padding EXIT

# x size: $geometry[1]
# y size: $geometry[2]
geometry=( $(xdotool getdisplaygeometry) )

xdotool search --classname $cname windowmap windowunmap  || \
#{ toggle_padding; urxvt -name quake-term -geometry 211x12-0-0 }
{ urxvt -name quake-term }
