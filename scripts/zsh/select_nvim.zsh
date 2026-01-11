vv() {
  # Assumes all configs exist in directories named ~/.config/nvim-*
  local config=$(find ~/.config -maxdepth 1 -type d -name 'nvim*' | fzf-tmux --prompt="Neovim Configs > " -h 50% --layout=reverse --border --exit-0)
 
  # If I exit fzf without selecting a config, don't open Neovim
  [[ -z $config ]] && echo "No config selected" && return
 
  # Open Neovim with the selected config
  NVIM_APPNAME=$(basename $config) nvim $@
}
