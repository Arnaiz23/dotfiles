# Dotfiles of Adrián Arnaiz

This configuration of the Linux terminal is 100% personal.

## Includes


## Installation
	
	git clone https://github.com/arnaiz23/dotfiles ~/.dotfiles
	cd dotfiles
	sh install.sh
	nvm install --lts (or other version)

## Requisites

If you don't have a non-root user with sudo privileges, create it before run this script:
	
	adduser arnaiz --quiet
	usermod -aG sudo arnaiz
	apt update -y && apt install -y sudo git
	su arnaiz
