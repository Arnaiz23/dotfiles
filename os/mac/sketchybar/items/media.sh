#!/bin/bash

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

sketchybar --add event spotify_change $SPOTIFY_EVENT \
  --add item media center \
  --set media label.color=$ACCENT_COLOR \
  label.max_chars=30 \
  icon.padding_left=0 \
  icon=󰎇 \
  icon.color=$ACCENT_COLOR \
  background.drawing=off \
  click_script="open -a Spotify" \
  script="$PLUGIN_DIR/media.sh" \
  updates=on \
  --subscribe media spotify_change
