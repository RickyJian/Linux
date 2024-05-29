#!/bin/bash
# Program:
# 	Launch ibus after login
# History:
# 	2020/10/25
GDK_SCALE= GDK_DPI_SCALE= /usr/bin/ibus-daemon --xim --replace --daemonize
notify-send 'ibus is starting'

