symlib() {
  local node_modules_dir="$(pwd)/node_modules"
  local libs=("commercial-management--digital--web-components-design--library" "ib-web-ancillaries" "ib-menus" "ib-style-modules" "ib-web-commons" "ib-web-payments")

  for lib in "${libs[@]}"
  do
    if [[ -L "$node_modules_dir/$lib/dist" ]]; then
      gumlog "info" "The lib \"$lib\" is symbolic!!"
    fi
  done
}
