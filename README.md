# Dotfiles of Adrián Arnaiz

This configuration of the Linux terminal is 100% personal.

## Includes

- Shell: ZSH + OH-MY-ZSH + Powerlevel10k theme
- Plugins: Zgen
- Essentials tools: wget + git
- CLI Editors: vim + nano
- CLI tools: jq
- API/Request tools: curl + http
- Help/Info: man + tldr + neofetch
- Fun: lolcat
- Compressors/conversors: unzip + zip
- Package Managers: Node/NVM/PNPM
- Containers: Docker

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
