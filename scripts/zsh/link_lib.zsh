link_lib() {
  local current_directory=$(pwd)

  declare -A libs_build=( ["react"]="/Users/adrian.arnaiz/Dev/iberia/github/libraries/dscomponents-v2/dist" ["menu"]="/Users/adrian.arnaiz/Dev/iberia/github/forks/ib-menus-digital/dist" ["style"]="/Users/adrian.arnaiz/Dev/iberia/github/libraries/ib-style-modules/dist" ["commons"]="/Users/adrian.arnaiz/Dev/iberia/github/libraries/ib-web-commons/dist" ["payments"]="/Users/adrian.arnaiz/Dev/iberia/github/forks/libraries/web-payments/dist" ["ancillaries"]="/Users/adrian.arnaiz/Dev/iberia/github/libraries/ib-web-ancillaries/dist" )
  declare -A libs_node_modules=( ["react"]="$current_directory/node_modules/commercial-management--digital--web-components-design--library/" ["menu"]="$current_directory/node_modules/ib-menus/" ["style"]="$current_directory/node_modules/ib-style-modules/" ["commons"]="$current_directory/node_modules/ib-web-commons/" ["payments"]="$current_directory/node_modules/ib-web-payments/" ["ancillaries"]="$current_directory/node_modules/ib-web-ancillaries/" )

  lib=$1

  if [[ -z "${libs_build[$lib]}" ]]; then
    echo """
    Lib not found.
    
    Options:
      - react
      - menu
      - style
      - commons
      - payments
      - ancillaries
    """
    return
  fi

  local folder_name=$(basename "$current_directory")

  if [[ "$folder_name" != *checkin* ]]; then
    gumlog "error" "This folder is not checkin project"
    return
  fi

  local build_path=${libs_build[$lib]}
  local node_modules_path=${libs_node_modules[$lib]}

  gumlog "info" "Deleting dist folder from node_modules..."
  rm -rf "$node_modules_path/dist"
  gumlog "info" "Creating the symlink"
  ln -s "$build_path" "$node_modules_path"

  gumlog "info" "Checking if all works correctly..."

  if [[ -L "$node_modules_path/dist" ]]; then
    symlib
  else
    gumlog "error" "Error!!"
  fi
}
