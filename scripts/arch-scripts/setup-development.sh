#! /bin/bash
# ===============================================================================================
# Title: Arch Linux Setup Script
# Description: This script is part of the dotfiles and is used to install packages on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-11-06
# ===============================================================================================

# --------
source "$HOME/dotfiles/scripts/env_variables.sh"
# --------

# --------
install_devops() {
	echo -e "${Gre}➞ [+] Installing devops packages..${Whi}"
	yay -S --needed --noconfirm $(cat "$devops_pkgs")
	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_docker() {
	echo -e "${Gre}➞ [+] Installing Docker..${Whi}"
	yay -S --needed --noconfirm $(cat "$docker_pkgs")
	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_dotnet() {
	echo -e "${Gre}➞ [+] Installing dotnet..${Whi}"
	yay -S --needed --noconfirm $(cat "$dotnet_pkgs")
	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_java() {
	echo -e "${Gre}➞ [+] Installing java..${Whi}"
	yay -S --needed --noconfirm $(cat "$java_pkgs")
	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_IDEs() {
	ides=($(cat "$ides_pkgs"))
	echo -e "${Cya}➞ [+] Available IDEs for installation:${Whi}"
	cat "$ides_pkgs"

	install_array_of_pkgs "${ides[@]}"

	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_nodejs() {
	echo -e "${Gre}➞ [+] Installing nodejs and npm..${Whi}"
	yay -S --needed --noconfirm $(cat "$nodejs_pkgs")
	echo "$Sperator"
	sleep $sleep_time
}

# --------
run_IDE_installation() {
	echo -e "${Cya}➞ [+] Do you want to install IDEs tools? ${Whi}"
	read -r answer
	if [ "$answer" == "y" ]; then
		install_IDEs
	fi
}

# --------
run_dotnet_installation() {
	echo -e "${Cya}➞ [+] Do you want to install dotnet? ${Whi}"
	read -r answer
	if [ "$answer" == "y" ]; then
		install_dotnet
	fi
}

# --------
run_java_installation() {
	echo -e "${Cya}➞ [+] Do you want to install java? ${Whi}"
	read -r answer
	if [ "$answer" == "y" ]; then
		install_java
	fi
}

# --------
run_nodejs_installation() {
	echo -e "${Cya}➞ [+] Do you want to install nodejs? ${Whi}"
	read -r answer
	if [ "$answer" == "y" ]; then
		install_nodejs
	fi
}

# --------
run_docker_installation() {
	echo -e "${Cya}➞ [+] Do you want to install docker? ${Whi}"
	read -r answer
	if [ "$answer" == "y" ]; then
		install_docker
	fi
}

# --------
run_devops_installation() {
	echo -e "${Cya}➞ [+] Do you want to install devops tools? ${Whi}"
	read -r answer
	if [ "$answer" == "y" ]; then
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
