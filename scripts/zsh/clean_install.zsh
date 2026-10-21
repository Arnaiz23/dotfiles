#!/bin/zsh

PACKAGE_LOCK="$(pwd)/package-lock.json"
NODE_MODULES="$(pwd)/node_modules"

gum_spinner() {
  local message=$1
  shift
  gum spin --spinner dot --title "$message" -- "$@"
}

clean_install() {
  if [[ -f "$PACKAGE_LOCK" ]]; then
    gum_spinner "Removing the file package-lock.json" rm -r "$PACKAGE_LOCK"
  fi

  if [[ -d "$NODE_MODULES" ]]; then
    gum_spinner "Removing the folder node_modules" rm -rf "$NODE_MODULES"
  fi

  gum_spinner "Installing dependencies from zero" npm i

  gum log --time kitchen --level info  "Install finished!!!"
}
