#!/bin/sh

# systray battery icon
cbatticon -u 5 &
# systray volume
volumeicon &

# feh
~/.fehbg &

# Prueba keyring
# Si no funciona:
gnome-keyring-daemon --start
