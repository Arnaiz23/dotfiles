#!/bin/sh

# systray battery icon
cbatticon -u 5 &
# systray volume
volumeicon &

# feh
~/.fehbg &

# network icon
nm-applet &

# picom
picom &

# bluetooth icon
blueman-applet &

dbus-update-activation-environment --all
gnome-keyring-daemon --start --components=secrets
