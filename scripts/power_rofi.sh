#!/bin/bash

chosen=$(printf "  Power Off\n  Restart\n  Suspend\n  Lock\n" | rofi -dmenu -i)

case "$chosen" in
    "  Power Off")
        shutdown now
        ;;
    "  Restart")
        shutdown -r now
        ;;
    "  Suspend")
        systemctl suspend
        ;;
    "  Lock")
        slock
        ;;
    *) exit 1
        ;;
esac
