#
apt-get update
#sudo apt-get install -y \
#	vim git bat zsh wget curl lsb-release \
#	jq less catimg tldr man neofetch htop unzip zip \
#	exa lolcat gpg locate zgen net-tools nmap ncal \
#	neovim docker libxcrypt-compat tmux rofi alacritty redshift \
#	dunst feh tree
#
clear;
sudo=`which sudo | wc -l`

if [ $sudo -eq 0 ]; then
	apt install sudo
	clear;
	echo "The package 'sudo' has been installed"
else
	echo "The package 'sudo' is installed"
fi
