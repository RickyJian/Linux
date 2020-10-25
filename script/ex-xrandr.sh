#!/bin/bash
# Program:
#	external xrandr displays
# History
# 	2020/10/11

secondary=$(</sys/class/drm/card0/card0-DP-1/status)
connected=connected

if [ "$secondary" == "$connected" ]; then
       	 xrandr --output eDP1 --off --output DP1 --primary --mode 1920x1080 --pos 618x0 --scale 1.75x1.75 --rotate normal --output DP2 --off --output VIRTUAL1 --off
	notify-send 'switch to external display'
fi

