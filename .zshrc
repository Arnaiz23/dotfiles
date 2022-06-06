ZSH_THEME="powerlevel10k/powerlevel10k"

# Reload theme
source $ZSH/oh-my-zsh.sh

plugins=(
  git common-aliases colored-man-pages zsh-autosuggestions zsh-syntax-highlighting
)

export PAGER="less"

# node
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases

alias tree="exa --icons --tree -L 1 -I node_modules"
alias ls="exa --icons"
alias grep="grep --color"
alias cat="bat"
alias gitlog="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"

echo "$(cat $HOME/.dotfiles/banner)" | lolcat
