#!/bin/bash

gitdiff() {
  # git diff $1 $2 | diff-so-fancy
  local from=$1
  local to=$2

  local diff_files=($(git diff $from $to --name-only))

  local selected=$(printf '%s\n' "${diff_files[@]}" | fzf \
    --preview "git diff $from $to --color=always -- '{}' 2>/dev/null || true" \
    --header "Modified files (${#diff_files[@]}). Enter=open"
  )

  [[ -n "$selected" ]] && git diff $from $to -- "$selected" | diff-so-fancy | less -R
}
