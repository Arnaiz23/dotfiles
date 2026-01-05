show_functions() {
	local options=('gitclone' 'checkin_up' 'newdir' 'i' 'globant-git' 'vv' 'github-login-iberia' 'personal-git' 'angular-husky' 'uitest' 'link_react' 'link_lib' 'symlib')

	echo "Custom functions:"

	for opt in "${options[@]}"; do
		echo " - $opt"
	done
}
