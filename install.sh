#!/bin/bash

# Script sobre los dotfiles de Adrián Arnaiz


export DEBIAN_FRONTEND=noninteractive

# Update linux

sudo pacman -Syu

# Programs

sudo pacman -S \
	sudo vim nano git bat zsh wget curl lsb-release \
	jq less catimg tldr man neofetch htop unzip zip \
	exa lolcat gpg locate net-tools nmap ncal neovim

# Fix batcat -> cat (Debian)
sudo ln -s /usr/bin/batcat /usr/local/bin/bat

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo source $HOME/.dotfiles/.zshrc >> ~/.zshrc

# Install zgen
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"


# Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source $HOME/.nvm/nvm.sh
nvm install --lts

# Docker install
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo pacman -Syu && sudo pacman -S docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# Modify vim/nvim

git clone https://github.com/Arnaiz23/Vim.git  .vimconfigure
cp .vimconfigure/.vimrc ~/.vimrc

mkdir ~/.config/nvim
echo "source ~/.vimrc" >> ~/.config/nvim/init.vim

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Plugins zsh
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Change zsh
chsh -s `which zsh`
zsh




