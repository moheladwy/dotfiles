#!/bin/bash
# ===============================================================================================
# Title: Arch Linux Setup Script
# Description: This script is part of the dotfiles and is used to install packages on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-11-06
# ===============================================================================================
set -euo pipefail

# --------
source "$HOME/dotfiles/scripts/env_variables.sh"
# --------

if ! command -v pacman &>/dev/null; then
	echo "Error: This script is for Arch Linux only." >&2
	exit 1
fi

# --------
install_kde() {
	echo -e "${Gre}➞ [+] Installing KDE Plasma..${Whi}"
	mapfile -t _pkgs < "$kde_pkgs"
	yay -S --needed --noconfirm "${_pkgs[@]}"
	sudo systemctl enable sddm
}

# --------
install_gnome() {
	echo "Installing GNOME and applications..."
	mapfile -t _pkgs < "$gnome_pkgs"
	yay -S --needed --noconfirm "${_pkgs[@]}"
	sudo systemctl enable gdm
}

# --------
install_xfce() {
	echo "Installing XFCE and applications..."
	mapfile -t _pkgs < "$xfce_pkgs"
	yay -S --needed --noconfirm "${_pkgs[@]}"
	sudo systemctl enable lightdm
}

# --------
install_cinnamon() {
	echo "Installing Cinnamon and applications..."
	mapfile -t _pkgs < "$cinnamon_pkgs"
	yay -S --needed --noconfirm "${_pkgs[@]}"
	sudo systemctl enable sddm
}

# --------
install_hyprland() {
	echo -e "${Gre}➞ [+] Installing Hyprland..${Whi}"
	mapfile -t _pkgs < "$hyprland_pkgs"
	yay -S --needed --noconfirm "${_pkgs[@]}"
	sudo systemctl enable sddm
}

# --------
choose_desktop() {
	while true; do
		echo -e "${Cya}➞ [+] Available desktop environments for installation:${Whi}"
		echo -e "${Cya}➞ [+] 1- kde"
		echo -e "${Cya}➞ [+] 2- gnome"
		echo -e "${Cya}➞ [+] 3- xfce"
		echo -e "${Cya}➞ [+] 4- cinnamon"
		echo -e "${Cya}➞ [+] 5- hyprland"
		echo -e "${Cya}➞ [+] What do you want to install [1/2/3/4/5/any other key to skip]? ${Whi}"
		read -r answer

		case $answer in
		1)
			install_kde
			break
			;;
		2)
			install_gnome
			break
			;;
		3)
			install_xfce
			break
			;;
		4)
			install_cinnamon
			break
			;;
		5)
			install_hyprland
			break
			;;
		*)
			echo -e "${Red}➞ [-] Skipping desktop installation.${Whi}"
			break
			;;
		esac
	done

	sudo systemctl enable NetworkManager

	echo "$Sperator"
	sleep "$sleep_time"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	choose_desktop
fi
