#!/bin/bash

sketchybar --add item aerospace_mode right \
  --set aerospace_mode script="$PLUGIN_DIR/mode.sh" \
  --subscribe aerospace_mode aerospace_enter_service_mode aerospace_enter_normal_mode aerospace_enter_apps_mode
