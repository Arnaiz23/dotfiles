#!/bin/bash

#######################################
# Install and configure lazygit
#######################################

PS3="Select your distribution please: "

select dsb in Ubuntu Arch Quit
do
	case $dsb in
		"Ubuntu")
			# Ubuntu commands to install lazygit
			LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

	 		curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

	 		tar xf lazygit.tar.gz lazygit

	 		sudo install lazygit /usr/local/bin

	 		lazygit --version

			break;;
		"Arch")
			# Arch command to install lazygit
			sudo pacman -S lazygit
			break;;
		"Quit")
			echo "Exit"
			break;;
		*)
			echo "Opss...";;
	esac
done
