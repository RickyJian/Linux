#!/bin/bash
# Program:
#	single xrandr displays
# History
# 	2020/10/11

primary=$(</sys/class/drm/card0/card0-eDP-1/status)
connected=connected

if [ "$primary" == "$connected" ]; then 
       	 xrandr --output eDP1 --primary --mode 3200x1800 --pos 698x1890 --rotate normal --scale 1x1 --output DP1 --off --output DP2 --off --output VIRTUAL1 --off
	notify-send 'switch to primary display'
fi

