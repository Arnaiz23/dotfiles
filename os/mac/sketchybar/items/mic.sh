#!/bin/bash

sketchybar --add item mic right \
  --set mic update_freq=3 \
  script="$PLUGIN_DIR/mic.sh" \
  --suscribe mic system_woke
