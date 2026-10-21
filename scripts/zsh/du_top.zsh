du_top() {
  local dir=${1:-.}
  local count=${2:-10}

  if [[ ! -d "$dir" ]]; then
    print "Directory '$dir' does not exist!!!"
    return 1
  fi

  du -h -d 1 "$dir" 2>/dev/null | sort -hr | head -"$count"
}
