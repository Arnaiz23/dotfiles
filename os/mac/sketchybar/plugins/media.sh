#!/bin/bash

STATE="$(echo "$INFO" | jq -r '.["Player State"]')"
if [ "$STATE" = "Playing" ]; then
  MEDIA="$(echo "$INFO" | jq -r '.Name + " - " + .Artist')"
  sketchybar --set $NAME label="$MEDIA" drawing=on
else
  sketchybar --set $NAME drawing=off
fi
