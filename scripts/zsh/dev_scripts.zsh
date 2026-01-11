nr() {
  detect-program "gum"

  local options=('eslint' 'build' 'test')
  local foreground="#926afe"
  local fsuccess="#00ff00"
  local ferror="#ff0000"

  echo "Select a script:"

  local option=$(gum choose --cursor.foreground="$foreground" $options)

  if ! [[ " ${options[*]} " =~ " ${option} " ]]; then
    gum log --time kitchen --level error "The selected option ($option) doesn't exist"
    return
  fi

  local command="npm run ${option}"

  clear

  gum style \
	--foreground $foreground --border-foreground $foreground --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	"Command: \`${command}\`"

  echo
  gum style --foreground=$foreground  --bold "▶ Executing..."
  echo

  if npm run "$option"; then
    echo
    gum style --foreground $fsuccess "✓ Success!"
  else
    local exit_code=$?
    echo
    gum style --foreground $ferror "✗ Failed (exit code: $exit_code)"
    return $exit_code
  fi
}
nr
