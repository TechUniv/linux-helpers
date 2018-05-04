#!/bin/bash

# Script to toggle between low/high resolution
# JMD 5/2/2018

res=`xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/'`
if [ "$res" == '3840x2160' ];then
    xrandr --output eDP-1 --mode 1920x1080
elif [ "$res" == '1920x1080' ]
then
    xrandr --output eDP-1 --mode 3840x2160
else
    echo "You are neither in high or low resolution mode.  Script will exit taking no action"
fi
