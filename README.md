# Dotfiles of Adrián Arnaiz

This is the configuration of the Linux terminal. 

## Includes

- Shell: ZSH + OH-MY-ZSH + Powerlevel10k theme
- Plugins: Zgen
- Essentials tools: wget + git
- CLI Editors: vim + nano + neovim
- CLI tools: jq
- API/Request tools: curl + http
- Help/Info: man + tldr + neofetch
- Fun: lolcat
- Compressors/conversors: unzip + zip
- Package Managers: Node/NVM/PNPM
- Containers: Docker

## Installation

```sh
git clone https://github.com/arnaiz23/dotfiles ~/.dotfiles
cd .dotfiles
sh installer/arch_linux.sh || sh installer/ubuntu.sh
nvm install --lts (or other version)
```

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
- installers
	- arch_linux.sh -> Script of the installer in Arch
	- ubuntu.sh -> Script of the installer in Ubuntu
- alacritty -> folder with the alacritty configuration
- qtile -> folder with the qtile configuration

## Neovim / Vim

Configuration of neovim (IDE mode)

- Vim-plug -> Installer of vim plugins
	* `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`

## Coc Config (For default is disabled)

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
	- Later, execute :CocInstall (If you use Coc, for default disabled)
- For tmux:
	- Execute tmux, Ctrl + r and Ctrl + I

## Configurations

### QTILE

### TMUX

- `Ctrl-Space` -> leader
- `Ctrl-Space [` -> enter in copy mode
	- vi keys move
- `leader + ?` -> help commands
