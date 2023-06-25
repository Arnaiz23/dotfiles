#!/bin/bash

packages=(neovim tmux zoxide ranger bat docker docker-compose exa htop jq neofetch nmap tree tldr ttf-firacode-nerd unrar unzip zip vim wget npm yarn zsh git fzf)

os_options=("Arch" "Ubuntu")
PS3="Enter a number: "

select option in ${os_options[@]}
do
    case "$option" in
        "Arch")
            # Update the system
            sudo pacman -Syu --noconfirm
            clear

            # Install the packages
            sudo pacman -S --noconfirm "${packages[@]}"
            clear

            # Install yay
            sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

            # Configure zsh
            # Install oh-my-zsh
            sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
            ln -s ~/.dotfiles/.zshrc ~/.zshrc

            # Install powerlevel10k
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

            # Install zgen
            git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

            # Change zsh to default
            chsh -s `which zsh`
            zsh

            # Install node and nvm
            curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
            source $HOME/.nvm/nvm.sh
            nvm install --lts

            # Configure neovim
            ln -s ~/.dotfiles/nvim ~/.config/nvim

            # Configure tmux
            ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf

            # Configure lazygit
            sudo pacman -S --noconfirm lazygit
            ln -s ~/.dotfiles/lazygit/config.yml ~/.config/lazygit/config.yml

            # Configure ranger
            ln -s ~/.dotfiles/ranger/* ~/.config/ranger/

            # Install x11-emoji-picker
            yay -S x11-emoji-picker-git
            exit
            ;;

        "Ubuntu")
            # Update the system
            sudo apt-get update -y && sudo apt-get upgrade -y
            clear

            # Install the packages
            sudo apt-get install -y "${packages[@]}"
            clear

            # Configure zsh
            # Install oh-my-zsh
            sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
            ln -s ~/.dotfiles/.zshrc ~/.zshrc

            # Install powerlevel10k
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

            # Install zgen
            git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

            # Change zsh to default
            chsh -s `which zsh`
            zsh

            # Install node and nvm
            curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
            source $HOME/.nvm/nvm.sh
            nvm install --lts

            # Configure neovim
            ln -s ~/.dotfiles/nvim ~/.config/nvim

            # Configure tmux
            ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf

            # Install lazygit
            LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

            curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

            tar xf lazygit.tar.gz lazygit

            sudo install lazygit /usr/local/bin

            # Configure lazygit
            sudo pacman -S --noconfirm lazygit
            ln -s ~/.dotfiles/lazygit/config.yml ~/.config/lazygit/config.yml

            # Configure ranger
            ln -s ~/.dotfiles/ranger/* ~/.config/ranger/

            exit
            ;;
        *) echo "Invalid option"
    esac
done
