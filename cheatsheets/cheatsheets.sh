#!/bin/bash

DIR="$HOME/.dotfiles/cheatsheets/"

FILE=$(find "$DIR" -type f -name "*.md" -printf "%f\n" |
  sed 's/\.md$//' |
  rofi -dmenu -p "Cheatsheets")

[ -z "$FILE" ] && exit 0

alacritty --class keybinds-cheatsheet -e glow --pager "$DIR/$FILE.md"
