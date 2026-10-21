rg_folder_count() {
  local pattern=$1
  local dir=${2:-.}

  if [[ -z "$pattern" ]]; then
    print "Params empty!!!"
    return
  fi


  rg "$pattern" -c "$dir" \
  | awk -F: '{print $1}' \
  | awk -F/ '{print $2}' \
  | sort | uniq -c

  
  # rg --type html "PATTERN" -c "$dir" \
  # | awk -F'[:/]' -v d="$dir" '
  #   {
  #     gsub("^" d "/?", "", $1)
  #     print $1
  #   }
  # ' \
  # | sort | uniq -c
}
