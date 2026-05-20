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
source "$HOME/dotfiles/$arch_scripts_dir/install-pkgs.sh"
# --------

if ! command -v pacman &>/dev/null; then
	echo "Error: This script is for Arch Linux only." >&2
	exit 1
fi

# --------
install_devops() {
	echo -e "${Gre}➞ [+] Installing devops packages..${Whi}"
	mapfile -t _pkgs < "$devops_pkgs"
	yay -S --needed --noconfirm "${_pkgs[@]}"
	echo "$Sperator"
	sleep "$sleep_time"
}

# --------
install_docker() {
	echo -e "${Gre}➞ [+] Installing Docker..${Whi}"
	mapfile -t _pkgs < "$docker_pkgs"
	yay -S --needed --noconfirm "${_pkgs[@]}"
	echo "$Sperator"
	sleep "$sleep_time"
}

# --------
install_dotnet() {
	echo -e "${Gre}➞ [+] Installing dotnet..${Whi}"
	mapfile -t _pkgs < "$dotnet_pkgs"
	yay -S --needed --noconfirm "${_pkgs[@]}"
	echo "$Sperator"
	sleep "$sleep_time"
}

# --------
install_java() {
	echo -e "${Gre}➞ [+] Installing java..${Whi}"
	mapfile -t _pkgs < "$java_pkgs"
	yay -S --needed --noconfirm "${_pkgs[@]}"
	echo "$Sperator"
	sleep "$sleep_time"
}

# --------
install_IDEs() {
	mapfile -t ides < "$ides_pkgs"
	echo -e "${Cya}➞ [+] Available IDEs for installation:${Whi}"
	cat "$ides_pkgs"

	install_array_of_pkgs "${ides[@]}"

	echo "$Sperator"
	sleep "$sleep_time"
}

# --------
install_nodejs() {
	echo -e "${Gre}➞ [+] Installing nodejs and npm..${Whi}"
	mapfile -t _pkgs < "$nodejs_pkgs"
	yay -S --needed --noconfirm "${_pkgs[@]}"
	echo "$Sperator"
	sleep "$sleep_time"
}

# --------
run_IDE_installation() {
	echo -e "${Cya}➞ [+] Do you want to install IDEs tools? ${Whi}"
	read -r answer
	if [[ "$answer" =~ ^[Yy]$ ]]; then
		install_IDEs
	fi
}

# --------
run_dotnet_installation() {
	echo -e "${Cya}➞ [+] Do you want to install dotnet? ${Whi}"
	read -r answer
	if [[ "$answer" =~ ^[Yy]$ ]]; then
		install_dotnet
	fi
}

# --------
run_java_installation() {
	echo -e "${Cya}➞ [+] Do you want to install java? ${Whi}"
	read -r answer
	if [[ "$answer" =~ ^[Yy]$ ]]; then
		install_java
	fi
}

# --------
run_nodejs_installation() {
	echo -e "${Cya}➞ [+] Do you want to install nodejs? ${Whi}"
	read -r answer
	if [[ "$answer" =~ ^[Yy]$ ]]; then
		install_nodejs
	fi
}

# --------
run_docker_installation() {
	echo -e "${Cya}➞ [+] Do you want to install docker? ${Whi}"
	read -r answer
	if [[ "$answer" =~ ^[Yy]$ ]]; then
		install_docker
	fi
}

# --------
run_devops_installation() {
	echo -e "${Cya}➞ [+] Do you want to install devops tools? ${Whi}"
	read -r answer
	if [[ "$answer" =~ ^[Yy]$ ]]; then
		install_devops
	fi
}

# --------
choose_development_tools() {
	run_IDE_installation

	run_dotnet_installation

	run_java_installation

	run_nodejs_installation

	run_docker_installation

	run_devops_installation

	echo -e "${Gre}➞ [+] Development tools installed successfully.${Whi}"
	echo "$Sperator"
	sleep "$sleep_time"
}

choose_development_tools
