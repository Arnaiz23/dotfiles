# Enable Powerlevel10k instant prompt.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Selecth the zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git common-aliases colored-man-pages z
)

# Reload theme
source $ZSH/oh-my-zsh.sh

# Load the plugins
source "${HOME}/.zgen/zgen.zsh"
zgen load zsh-users/zsh-syntax-highlighting
zgen load zsh-users/zsh-autosuggestions
zgen load zsh-users/zsh-completions
zgen oh-my-zsh plugins/sudo

export PAGER="less"

# node
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases

alias treel="exa --icons --tree -L 1 -I node_modules"
alias tree="tree -I node_modules"
alias ls="exa --icons"
alias grep="grep --color"
alias cat="bat"
alias gitlog="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias gc="git commit"
alias gpo="git push origin"
alias v="nvim"
alias py="python3"
alias cz="git-cz"
alias bgwp="feh --bg-scale ~/Imágenes/wallpaper.jpg"
alias zshconfig="v ~/.dotfiles/.zshrc"
alias qtilelogs="tail --lines 20 ~/.local/share/qtile/qtile.log"

# lazygit
alias lg="lazygit"

# delete node_modules
alias nmkill="npx npkill"

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

#echo "$(cat $HOME/.dotfiles/banner)" | lolcat
#echo "ArchFade" | lolcat
