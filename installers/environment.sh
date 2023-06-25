#!/bin/bash

options=("qtile" "gnome")

PS3="Select an option: "

select i in ${options[@]}
do
    case $i in
        "qtile")
            sudo pacman -S qtile pacman-contrib --noconfirm
            ln -s ~/.dotfiles/qtile ~/.config/qtile
            clear
            echo "Restart the pc and select qtile before signin."
            exit
            ;;
        "gnome")
            sudo pacman -S --noconfirm xorg xorg-server gnome
            clear
            sudo systemctl start gdm.service
            sudo systemctl enable gdm.service
            clear
            sudo pacman -S --noconfirm gnome-tweaks
            clear
            echo "Restart the pc and select gnome before signin."
            exit
            ;;
        *) echo "Invalid option" ;;
    esac
done
