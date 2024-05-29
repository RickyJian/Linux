#!/bin/bash
# Program:
#	Auto xrandr displays
# History
# 	2020/10/11

primary=$(</sys/class/drm/card0/card0-eDP-1/status)
secondary=$(</sys/class/drm/card0/card0-DP-1/status)
connected=connected

if [ "$primary" == "$connected" ] && [ "$secondary" == "$connected" ]; then
       	 xrandr --output eDP1 --primary --mode 3200x1800 --pos 698x1890 --rotate normal --scale 1x1 --output DP1 --mode 1920x1080 --pos 618x0 --scale 1.75x1.75 --rotate normal --output DP2 --off --output VIRTUAL1 --off
	notify-send 'switch to multi displays'
elif [ "$primary" == "$connected" ]; then 
       	 xrandr --output eDP1 --primary --mode 3200x1800 --pos 698x1890 --rotate normal --scale 1x1 --output DP1 --off --output DP2 --off --output VIRTUAL1 --off
	notify-send 'switch to primary display'
elif [ "$secondary" == "$connected" ]; then
       	 xrandr --output eDP1 --off --output DP1 --primary --mode 1920x1080 --pos 618x0 --scale 1.75x1.75 --rotate normal --output DP2 --off --output VIRTUAL1 --off
	notify-send 'switch to external display'
fi

