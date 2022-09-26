# Dotfiles of Adrián Arnaiz

This is the configuration of the Linux terminal. 

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

## Structure of repository

- .tmux.conf -> Configuration of tmux
- nvim -> Folder with nvim configuration
	- .vimrc -> Global configurations of Vim and Neovim
	- coc.vim -> Configuration of the coc extension
	- init.vim -> Configuration of neovim
- .zshrc -> Configuration of zsh
- install.sh -> Script of the installer
- alacritty -> folder with the alacritty configuration
- qtile -> folder with the qtile configuration

## Neovim / Vim

Configuration of neovim

- Vim-plug -> Installer of vim plugins

## Coc Config

- Copy the coc-settings.json in the :CocConfig

## Coc extensions

- coc-html # Extension para html
- coc-eslint # Extension para eslint
- coc-tsserver # Extension para JS y TS
- coc-json # Extension para json
- coc-docker # Extension para Dockerfile
- coc-css # Extension para CSS
- @yaegassy/coc-tailwindcss3 # Extension para TailwindCSS

## Another instructions

- Clone the repository
- Execute the script
- For neovim:
	- Execute v and :PlugInstall
	- Later, execute :CocInstall
- For tmux:
	- Execute tmux, Ctrl + r and Ctrl + I

## Configurations

### QTILE

If I want, I can to copy one theme and create my own style changing the colors

### TMUX

- Ctrl-Space -> leader
- Ctrl-Space [ -> enter in copy mode
	- vi keys move
- leader + ? -> help commands
