gumlog() {
  if ! command -v "gum" 2>&1 > /dev/null; then
    printf "
      The program 'gum' is not installed.\n
      If you want to install it, go to: https://github.com/charmbracelet/gum
    "
    return 1
  fi

  local options=("debug" "info" "warn" "error" "fatal")

  if [[ ! -n ${options[(r)$1]} ]]; then
    echo "############################" >&2
    echo "#      Invalid option      #" >&2
    echo "############################\n" >&2
    echo "Try again with:" >&2
    for opt in "${options[@]}"
    do
      echo "  * $opt" >&2
    done

    return 1
  fi

  gum log --time kitchen --level $1 $2 2>&1 >/dev/null

}
