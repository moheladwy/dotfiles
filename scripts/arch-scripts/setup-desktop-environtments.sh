# ===============================================================================================
# Title: Arch Linux Setup Script
# Description: This script is part of the dotfiles and is used to install packages on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-11-06
# ===============================================================================================
#! /bin/bash

# --------
source "$dotfiles_dir/scripts/env_variables.sh"
# --------

# --------
install_kde() {
	echo -e "${Gre}➞ [+] Installing KDE Plasma..${Whi}"
	yay -S --needed --noconfirm $(cat "$kde_pkgs")
	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_gnome() {
    echo "Installing GNOME and applications..."
    sudo pacman -S --needed --noconfirm xorg gdm
    sudo systemctl enable gdm
    sudo pacman -S --noconfirm gnome gnome-extra networkmanager
}

# --------
install_xfce() {
    echo "Installing XFCE and applications..."
    sudo pacman -S --needed --noconfirm xorg lightdm lightdm-gtk-greeter
    sudo systemctl enable lightdm
    sudo pacman -S --noconfirm xfce4 xfce4-goodies networkmanager
}

# --------
install_cinnamon() {
    echo "Installing Cinnamon and applications..."
    sudo pacman -S --needed --noconfirm xorg sddm
    sudo systemctl enable sddm
    sudo pacman -S --noconfirm cinnamon nemo-fileroller networkmanager
}

# --------
install_hyprland() {
	echo -e "${Gre}➞ [+] Installing Hyprland..${Whi}"
	yay -S --needed --noconfirm $(cat "$hyprland_pkgs")
	echo "$Sperator"
	sleep $sleep_time
}

# --------
choose_desktop() {
	while true; do
    echo -e "${Cya}➞ [+] Available desktop enviromnets for installation:"
    echo -e "${Cya}➞ [+] 1- kde"
    echo -e "${Cya}➞ [+] 2- gnome"
    echo -e "${Cya}➞ [+] 3- xfce"
    echo -e "${Cya}➞ [+] 4- cinnamon"
    echo -e "${Cya}➞ [+] 5- hyprland"
    echo -e "${Cya}➞ [+] Do you want to install kde or hyprland [1/2/3/4/5/any other key to skip]? ${Whi}"
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
	done;

	sudo systemctl enable NetworkManager

	echo "$Sperator"
	sleep $sleep_time
}

choose_desktop