github-login-iberia() {
  detect-program "gum"

  local options=('digital' 'dcexit' 'digital-new')
  typeset -A domains
  domains=(
    [digital]="059591087061"
    [dcexit]="329066851743"
    [digital-new]="471112762751"
  )

  echo "Select an account:"

  option=$(gum choose $options)

  if ! [[ " ${options[*]} " =~ " ${option} " ]]; then
    gum log --time kitchen --level error "The selected option ($option) doesn't exist"
    return
  fi

  gum log --time kitchen --level info  "Login with Account \"$option\""
  gum spin --spinner dot --title "Amazon" -- aws sso login --profile $option

  # gum spin --spinner dot --title "Codeartifact" -- aws codeartifact login --tool npm --repository npm-library-store --domain commercial --domain-owner $domains[$option] --region eu-west-1 --profile $option

  if [[ $option == $options[1] ]]; then
    gum spin --spinner dot --title "Codeartifact" -- aws codeartifact login --tool npm --repository npm-library-store --domain commercial --domain-owner 059591087061 --region eu-west-1 --profile $options[1]
    return
  fi

  if [[ $option == $options[2] ]]; then
    gum spin --spinner dot --title "Codeartifact" -- aws codeartifact login --tool npm --repository angular-library-store --domain iberia --domain-owner $domains[2] --region eu-west-1 --profile $options[2]
    return
  fi

  if [[ $option == $options[3] ]]; then
    gum spin --spinner dot --title "Codeartifact" -- aws codeartifact login --tool npm --repository angular-library-store --domain ibcom --domain-owner 471112762751 --region eu-west-1 --profile $options[3]
    return
  fi
}
