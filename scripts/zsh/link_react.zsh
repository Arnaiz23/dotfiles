link_react() {
  local angular_dir="/Users/adrian.arnaiz/Dev/iberia/github/web-checkin/node_modules/commercial-management--digital--web-components-design--library/"
  local react_dir="/Users/adrian.arnaiz/Dev/iberia/github/libraries/dscomponents-v2/dist"

  detect-program "gum"

  # Use gum log
  echo "Removing the dist from angular..."
  rm -rf "$angular_dir/dist"

  echo "Creating the link..."
  ln -s $react_dir $angular_dir

  echo "Checking if all works correctly..."

  if [[ -L "$angular_dir/dist" ]]; then
    echo "Done!!!"
  else
    echo "Try again later"
  fi
}
