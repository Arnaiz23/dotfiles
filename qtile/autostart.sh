#!/bin/sh

# systray battery icon
cbatticon -u 5 &
# systray volume
volumeicon &

# feh
~/.fehbg &

# network icon
nm-applet &
