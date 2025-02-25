#!/bin/bash

updates=$(checkupdates 2>/dev/null | wc -l)

if [ -z "$updates" ] || [ "$updates" -eq 0 ]; then
  echo "0"
else
  echo "$updates"
fi
