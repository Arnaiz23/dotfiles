github-login-iberia() {
  detect-program "gum"

  local options=('digital' 'dcexit')

  echo "Select an account:"

  option=$(gum choose $options)

  if ! [[ " ${options[*]} " =~ " ${option} " ]]; then
    gum log --time kitchen --level error "The selected option ($option) doesn't exist"
    return
  fi

  gum log --time kitchen --level info  "Login with Account \"$option\""
  gum spin --spinner dot --title "Amazon" -- aws sso login --profile $option

  if [[ $option == $options[1] ]]; then
    gum spin --spinner dot --title "Codeartifact" -- aws codeartifact login --tool npm --repository npm-library-store --domain commercial --domain-owner 059591087061 --region eu-west-1 --profile $options[1]
    return
  fi

  if [[ $option == $options[2] ]]; then
    gum spin --spinner dot --title "Codeartifact" -- aws codeartifact login --tool npm --repository angular-library-store --domain iberia --domain-owner 329066851743 --region eu-west-1 --profile $options[2]
    return
  fi
}
