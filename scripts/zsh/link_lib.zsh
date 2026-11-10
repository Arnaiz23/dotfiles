_link_lib_one() {
  local lib=$1
  local current_directory=$2
  eval "$3"
  eval "$4"

  if [[ -z "${libs_build[$lib]}" ]]; then
    gumlog "error" "Lib not found: $lib"
    return 1
  fi

  local build_path=${libs_build[$lib]}
  local node_modules_path=${libs_node_modules[$lib]}

  gumlog "info" "[$lib] Deleting dist folder from node_modules..."
  rm -rf "$node_modules_path/dist"
  gumlog "info" "[$lib] Creating the symlink"
  ln -s "$build_path" "$node_modules_path"

  gumlog "info" "[$lib] Checking if all works correctly..."

  if [[ -L "$node_modules_path/dist" ]]; then
    symlib
  else
    gumlog "error" "[$lib] Error!!"
    return 1
  fi
}

link_lib() {
  local current_directory=$(pwd)

  declare -A libs_build=( ["react"]="/Users/adrian.arnaiz/Dev/iberia/github/libraries/dscomponents-v2/dist" ["menu"]="/Users/adrian.arnaiz/Dev/iberia/github/forks/ib-menus-digital/dist" ["style"]="/Users/adrian.arnaiz/Dev/iberia/github/libraries/ib-style-modules/dist" ["commons"]="/Users/adrian.arnaiz/Dev/iberia/github/libraries/ib-web-commons/dist" ["payments"]="/Users/adrian.arnaiz/Dev/iberia/github/forks/libraries/web-payments/dist" ["ancillaries"]="/Users/adrian.arnaiz/Dev/iberia/github/libraries/ib-web-ancillaries/dist" )
  declare -A libs_node_modules=( ["react"]="$current_directory/node_modules/commercial-management--digital--web-components-design--library/" ["menu"]="$current_directory/node_modules/ib-menus/" ["style"]="$current_directory/node_modules/ib-style-modules/" ["commons"]="$current_directory/node_modules/ib-web-commons/" ["payments"]="$current_directory/node_modules/ib-web-payments/" ["ancillaries"]="$current_directory/node_modules/ib-web-ancillaries/" )

  local options=(react menu style commons payments ancillaries)
  local -a libs

  local folder_name=$(basename "$current_directory")
  if [[ "$folder_name" != *checkin* ]]; then
    gumlog "error" "This folder is not checkin project"
    return 1
  fi

  if [[ -n "$1" ]]; then
    # With params: use them directly
    libs=("$@")
  else
    # No params: interactive multi-select menu
    libs=("${(@f)$(gum choose --no-limit --header "Select the libraries to link (space to select, enter to confirm):" $options)}")
    if [[ ${#libs[@]} -eq 0 ]]; then
      gumlog "warn" "No libraries selected"
      return 1
    fi
  fi

  local lib
  local failed=0
  for lib in $libs; do
    _link_lib_one "$lib" "$current_directory" "$(typeset -p libs_build)" "$(typeset -p libs_node_modules)" || failed=1
  done

  return $failed
}
