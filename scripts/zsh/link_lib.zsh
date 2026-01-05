link_lib() {
  declare -A libs_build=( ["react"]="/Users/adrian.arnaiz/Dev/iberia/github/libraries/dscomponents-v2/dist" ["menu"]="/Users/adrian.arnaiz/Dev/iberia/github/forks/ib-menus-digital/dist" ["style"]="/Users/adrian.arnaiz/Dev/iberia/github/libraries/ib-style-modules/dist" )
  declare -A libs_node_modules=( ["react"]="/Users/adrian.arnaiz/Dev/iberia/github/web-checkin/node_modules/commercial-management--digital--web-components-design--library/" ["menu"]="/Users/adrian.arnaiz/Dev/iberia/github/web-checkin/node_modules/ib-menus/" ["style"]="/Users/adrian.arnaiz/Dev/iberia/github/web-checkin/node_modules/ib-style-modules/" )

  lib=$1

  if [[ -z "${libs_build[$lib]}" ]]; then
    echo """
    Lib not found.
    
    Options:
      - react
      - menu
      - style
    """
    return
  fi

  local build_path=${libs_build[$lib]}
  local node_modules_path=${libs_node_modules[$lib]}

  echo "Deleting dist folder from node_modules..."
  rm -rf "$node_modules_path/dist"
  echo "Creating the symlink"
  ln -s "$build_path" "$node_modules_path"

  echo "Checking if all works correctly..."

  if [[ -L "$node_modules_path/dist" ]]; then
    echo "Complete!!!"
  else
    echo "Error!!"
  fi
}
