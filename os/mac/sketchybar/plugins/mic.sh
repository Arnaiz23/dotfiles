#!/bin/bash

VOLUME="$(osascript -e 'get (input volume of (get volume settings))')"

if [ "$VOLUME" -le 0 ]; then
  ICON=""
else
  ICON=""
fi

echo "VOLUME: $VOLUME, ICON: $ICON" >> /tmp/mic_debug.log

sketchybar --set "$NAME" icon="$ICON" label="${VOLUME}%"
