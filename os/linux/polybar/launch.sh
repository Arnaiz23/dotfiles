#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# if type "xrandr" > /dev/null; then
# 	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
# 		MONITOR=$m polybar --reload mainbar-qtile -c ~/.config/polybar/config.ini &
# 	done
# else
# 	polybar --reload mainbar-qtile -c ~/.config/polybar/config.ini &
# fi
#
for m in $(polybar --list-monitors | cut -d":" -f1); do
  MONITOR=$m polybar --reload mybar &
done
