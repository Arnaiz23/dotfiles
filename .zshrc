ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git common-aliases colored-man-pages zsh-autosuggestions zsh-syntax-highlighting
)

export PAGER="less"


echo "$(cat $HOME/.dotfiles/banner)" | lolcat
