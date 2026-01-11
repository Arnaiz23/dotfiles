gitclone() {
	local companies=('iberia' 'globant')

	if [[ "$#" -eq 0 ]] || [[ $1 == "--help" ]]; then
		result=""

		for company in "${companies[@]}"; do
		    result+=" '$company' -"
		done

		echo "
			Help: \`gitclone\`\n
			   * Options: ${result% -}
			   * Repo: git ssh repositorie url
		" | tr -d '\t'
		return
	fi

	local company=$1
	local repo=$2
  local repo_name=$3

	if [[ $company == ${companies[2]} ]]; then
		newUrl=$(~/custom-scripts/convert-globant-url.js $repo)
		git clone $newUrl $repo_name
		local cdDir="$(basename -s .git $newUrl)"
		echo "
			Change the directory: \`cd $cdDir\`
		" | tr -d '\t'
		git --git-dir=./$cdDir/.git --work-tree=$cdDir config user.email 'adrian.arnaiz@globant.com'
		git --git-dir=./$cdDir/.git --work-tree=$cdDir config user.signkey ~/.ssh/id_ed25519.pub
		return
	fi

	git clone $repo $repo_name
}
