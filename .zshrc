ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git common-aliases colored-man-pages zsh-autosuggestions zsh-syntax-highlighting
)

export PAGER="less"

# Aliases

alias tree="exa --icons --tree -L 1 -I node_modules"
alias ls="exa --icons"
alias grep="grep --color"
alias cat="bat"
alias gitlog="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"

echo "$(cat $HOME/.dotfiles/banner)" | lolcat
