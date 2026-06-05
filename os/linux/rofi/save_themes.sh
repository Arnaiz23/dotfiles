#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
THEMES_FOLDER="$SCRIPT_DIR/themes"
ROFI_FOLDER="$HOME/.local/share/rofi/themes"

if [[ ! -d "$THEMES_FOLDER" ]]; then
  printf "The themes folder doesn't exists"
  exit 1
fi

main () {
  local files
  files=$(find ./themes -type f)

  mkdir -p "$ROFI_FOLDER"

  while read -r file; do
    cp "$file" "$ROFI_FOLDER"
  done <<< "$files"
}

main
