#!/bin/sh

LABEL="N"

case "$SENDER" in
  "aerospace_enter_service_mode")
    LABEL="S"
    ;;
  "aerospace_enter_normal_mode")
    LABEL="N"
    ;;
  "aerospace_enter_apps_mode")
    LABEL="A"
    ;;
esac

sketchybar --set "$NAME" label="${LABEL}"
