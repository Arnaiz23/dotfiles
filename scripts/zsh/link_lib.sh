#!/bin/bash

detect_program() {
  if ! command -v "$1" 2>&1 > /dev/null; then
    printf "
      The program '$1' is not installed.\n
    "
    return
  fi
}

detect_program "gum"
local options=('react' 'menu')

option=(gum choose options)
