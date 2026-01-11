##############################################################
#                      Custom functions                      #
##############################################################

ZSH_FUNCTIONS=~/.zsh/functions

show_functions() {
  unfunction $0
  source "$ZSH_FUNCTIONS/show_functions.zsh"
  $0 "$@"
}

gitclone() {
  unfunction $0
  source "$ZSH_FUNCTIONS/gitclone.zsh"
  $0 "$@"
}

checkin_up() {
  unfunction $0
  source "$ZSH_FUNCTIONS/checkin_up.zsh"
  $0 "$@"
}

newdir() {
	mkdir $1 && cd $1; 
}

i() {
  unfunction $0
  source "$ZSH_FUNCTIONS/install_dependencies.zsh"
  $0 "$@"
}

globant-git() {
  unfunction $0
  source "$ZSH_FUNCTIONS/globant_git.zsh"
  $0 "$@"
}

personal-git() {
  unfunction $0
  source "$ZSH_FUNCTIONS/personal_git.zsh"
  $0 "$@"
}

vv() {
  unfunction $0
  source "$ZSH_FUNCTIONS/select_nvim.zsh"
  $0 "$@"
}

detect-program() {
  if ! command -v "$1" 2>&1 > /dev/null; then
    printf "
      The program '$1' is not installed.\n
    "
    return
  fi
}


github-login-iberia() {
  unfunction $0
  source "$ZSH_FUNCTIONS/github_login_iberia.zsh"
  $0 "$@"
}

angular-husky() {
  unfunction $0
  source "$ZSH_FUNCTIONS/angular_husky.zsh"
  $0 "$@"
}

nr() {
  unfunction $0
  source "$ZSH_FUNCTIONS/dev_scripts.zsh"
  $0 "$@"
}

gum-spin() {
  unfunction $0
  source "$ZSH_FUNCTIONS/gum-spin.zsh"
  $0 "$@"
}

uitest() {
  unfunction $0
  source "$ZSH_FUNCTIONS/uitest.zsh"
  $0 "$@"
}

link_react() {
  unfunction $0
  source "$ZSH_FUNCTIONS/link_react.zsh"
  $0 "$@"
}

link_lib() {
  unfunction $0
  source "$ZSH_FUNCTIONS/link_lib.zsh"
  $0 "$@"
}

gitdiff() {
  unfunction $0
  source "$ZSH_FUNCTIONS/gitdiff.zsh"
  $0 "$@"
}

gumlog() {
  unfunction $0
  source "$ZSH_FUNCTIONS/gumlog.zsh"
  $0 "$@"
}

symlib() {
  unfunction $0
  source "$ZSH_FUNCTIONS/symlib.zsh"
  $0 "$@"
}

##############################################################
