#!/bin/bash

# Script to toggle between low/high resolution particularly useful
# for high resolution monitors where some applications load with tiny
# icons.

# To use, find your display name with this command: 
# xrandr | grep "connected primary"
# Output will look similar to this - in this example the display name is eDP-1:  
# eDP-1 connected primary 3840x2160+0+0

# Then replace the below resolutions with what you intend 
# (eg 3840x2160 and 1920x1080)
#
# Tech U 5/2/2018

res=`xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/'`
if [ "$res" == '3840x2160' ];then
    xrandr --output eDP-1 --mode 1920x1080
elif [ "$res" == '1920x1080' ]
then
    xrandr --output eDP-1 --mode 3840x2160
else
    echo "You are neither in high or low resolution mode.  Script will exit taking no action"
fi
