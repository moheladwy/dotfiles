#!/bin/bash
# ===============================================================================================
# Title: Arch Linux Setup Script
# Description: This script is part of the dotfiles and is used to install packages on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-11-06
# ===============================================================================================
set -euo pipefail

source "$HOME/dotfiles/scripts/env_variables.sh"

if ! command -v pacman &>/dev/null; then
	echo "Error: This script is for Arch Linux only." >&2
	exit 1
fi

# --------
install_nvidia() {
	echo -e "${Cya}➞ [+] Detecting running kernel...${Whi}"
	local kernel
	kernel=$(uname -r)

	if [[ "$kernel" == *"lts"* ]]; then
		echo -e "${Gre}➞ [+] LTS kernel detected. Installing nvidia-lts...${Whi}"
		yay -S --needed --noconfirm nvidia-lts nvidia-utils lib32-nvidia-utils nvidia-settings opencl-nvidia nvidia-prime
	else
		echo -e "${Gre}➞ [+] Standard kernel detected. Installing nvidia...${Whi}"
		yay -S --needed --noconfirm nvidia nvidia-utils lib32-nvidia-utils nvidia-settings opencl-nvidia nvidia-prime
	fi

	echo -e "${Gre}➞ [+] NVIDIA drivers installed successfully.${Whi}"
	echo -e "$Separator"
	sleep "$sleep_time"
}

# --------
main() {
	install_nvidia
	echo -e "${Gre}➞ [+] NVIDIA setup completed. Please reboot to apply changes.${Whi}"
}

main