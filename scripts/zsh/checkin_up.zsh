checkin_up() {
	# checkin_dir="/Users/adrian.arnaiz/Dev/iberia/github/web-checkin"

	# if [[ $(pwd) != $checkin_dir ]]; then
	# 	echo "This is not the checkin directory. Use \`cd $checkin_dir\`"
	# 	return
	# fi
  if ! pwd | grep -q "checkin" ; then
		echo "This is not the checkin directory. Use \`zi checkin\`"
		return
	fi

	if [[ $1 == "--help" ]] || [[ "$#" -eq 0 ]]; then
		echo "First parameter is the env type. Select one from the environment folder of the project."

		return
	fi

	env=$1

	npm run start --env=$env --ignore-proxy=true
}
