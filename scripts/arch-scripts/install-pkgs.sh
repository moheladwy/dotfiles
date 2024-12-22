#! /bin/bash
# ===============================================================================================
# Title: Arch Linux Setup Script
# Description: This script is part of the dotfiles and is used to install packages on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-11-06
# ===============================================================================================

source "$HOME/dotfiles/scripts/env_variables.sh"

# --------
install_array_of_pkgs() {
	# Read input line by line from pipeline or arguments
	pkgs_array=()
	if [ -p /dev/stdin ]; then
		# Reading from pipeline
		while IFS= read -r pkg; do
			pkgs_array+=("$pkg")
		done
	else
		# Reading from arguments
		pkgs_array=("$@")
	fi

	for pkg in "${pkgs_array[@]}"; do
		echo -e "${Cya}➞ [+] Do you want to install $pkg [y/any other key to skip]? ${Whi}"
		read -r answer

		if [ "$answer" != "${answer#[Yy]}" ]; then
			echo -e "${Cya}➞ [+] Installing $pkg..${Whi}"
			yay -S --needed --noconfirm "$pkg"
			echo -e "${Gre}➞ [+] $pkg installed successfully.${Whi}"
		else
			echo -e "${Red}➞ [-] Skipping $pkg installation.${Whi}"
		fi

		sleep 1
	done
}

# --------
install_git() {
	echo -e "${Gre}➞ [+] Installing git if not already installed..${Whi}"
	sudo pacman -S --noconfirm --needed git
	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_yay() {
	echo -e "${Gre}➞ [+] Installing yay AUR helper..${Whi}"
	cd "$HOME" || return

	mkdir -p "$source_dir"
	cd "$source_dir" || return

	if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
		echo -e "${Gre}➞ [+] yay is already installed.${Whi}"
	else
		echo -e "${Cya}➞ [+] Installing yay from the AUR...${Whi}"
		git clone https://aur.archlinux.org/yay.git
		cd yay || return
		makepkg -sfci --noconfirm --needed
	fi

	echo -e "${Gre}➞ [+] yay version: $(yay --version)${Whi}"
	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_main_pkgs() {
	echo -e "${Gre}➞ [+] The main packages will be installed now..${Whi}"
	yay -S --needed --noconfirm $(cat $all_pkgs)
	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_flatpak() {
	echo -e "${Gre}➞ [+] Installing flatpak if not already installed..${Whi}"
	sudo pacman -S --noconfirm --needed flatpak
	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_flatpak_apps() {
	flatpak_apps=($(cat "$flatpak_pkgs"))
	echo -e "${Cya}➞ [+] Available Flatpak apps for installation:${Whi}"
	cat "$flatpak_pkgs"

	install_array_of_pkgs "${flatpak_apps[@]}"

	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_browsers() {
	browsers=($(cat "$browsers_pkgs"))
	echo -e "${Cya}➞ [+] Available browsers for installation:${Whi}"
	cat "$browsers_pkgs"

	install_array_of_pkgs "${browsers[@]}"

	echo "$Sperator"
	sleep "$sleep_time"
}

# --------
install_filemanagers() {
	filemanagers=($(cat "$filemanagers_pkgs"))
	echo -e "${Cya}➞ [+] Available file managers for installation:${Whi}"
	cat "$filemanagers_pkgs"

	install_array_of_pkgs "${filemanagers[@]}"

	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_terminal() {
	echo -e "${Gre}➞ [+] Installing terminal..${Whi}"
	yay -S --needed --noconfirm $(cat "$terminal_pkgs")
	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_kvm() {
	echo -e "${Gre}➞ [+] Installing KVM and qemu..${Whi}"
	yay -S --needed --noconfirm $(cat "$kvm_pkgs")
	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_nvidia() {
	echo -e "${Gre}➞ [+] Installing NVIDIA drivers..${Whi}"
	yay -S --needed --noconfirm $(cat "$nvidia_pkgs")
	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_themes() {
	themes=($(cat "$theme_pkgs"))
	echo -e "${Cya}➞ [+] Available themes for installation:${Whi}"
	cat "$theme_pkgs"

	install_array_of_pkgs "${themes[@]}"

	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_monitoring_apps() {
	monitoring_apps=($(cat "$monitoring_pkgs"))
	echo -e "${Cya}➞ [+] Available monitoring apps for installation:${Whi}"
	cat "$monitoring_pkgs"

	install_array_of_pkgs "${monitoring_apps[@]}"

	echo "$Sperator"
	sleep $sleep_time
}

# --------
install_telecom_apps() {
	telecom_apps=($(cat "$telecom_pkgs"))
	echo -e "${Cya}➞ [+] Available telecom apps for installation:${Whi}"
	cat "$telecom_pkgs"

	install_array_of_pkgs "${telecom_apps[@]}"

	echo "$Sperator"
	sleep $sleep_time
}

# --------
run_flatpak_installation() {
	echo -e "${Cya}➞ [+] Do you want to install flatpak and its apps? ${Whi}"
	read -r answer
	if [ "$answer" == "y" ]; then
		install_flatpak
		install_flatpak_apps
	else
		echo -e "${Red}➞ [-] Skipping flatpak installation.${Whi}"
	fi
}

# --------
run_desktop_installation() {
	echo -e "${Cya}➞ [+] Do you want to install any desktop environment? ${Whi}"
	read -r answer
	if [ "$answer" == "y" ]; then
		chmod +x "$dotfiles_dir/scripts/arch-scripts/setup-desktop-environtments.sh"
		"$dotfiles_dir/scripts/arch-scripts/setup-desktop-environtments.sh"
	else
		echo -e "${Red}➞ [-] Skipping desktop installation.${Whi}"
	fi
}

# --------
run_browser_installation() {
	echo -e "${Cya}➞ [+] Do you want to install any browser? ${Whi}"
	read -r answer
	if [ "$answer" == "y" ]; then
		install_browsers
	else
		echo -e "${Red}➞ [-] Skipping browsers installation.${Whi}"
	fi
}

# --------
run_filemanager_installation() {
	echo -e "${Cya}➞ [+] Do you want to install any file manager? ${Whi}"
	read -r answer
	if [ "$answer" == "y" ]; then
		install_filemanagers
	else
		echo -e "${Red}➞ [-] Skipping file managers installation.${Whi}"
	fi
}

# --------
run_development_installation() {
	echo -e "${Cya}➞ [+] Do you want to install any kind of development tools? [y/any other key to skip] ${Whi}"
	read -r answer
	if [ "$answer" == "y" ]; then
		chmod +x "$dotfiles_dir/$arch_scripts_dir/setup-development.sh"
		"$dotfiles_dir/$arch_scripts_dir/setup-development.sh"
	else
		echo -e "${Red}➞ [-] Skipping development tools installation.${Whi}"
	fi
}

# --------
run_monitoring_apps_installation() {
	echo -e "${Cya}➞ [+] Do you want to install system monitoring apps? ${Whi}"
	read -r answer
	if [ "$answer" == "y" ]; then
		install_monitoring_apps
	else
		echo -e "${Red}➞ [-] Skipping monitoring apps installation.${Whi}"
	fi
}

# --------
run_telecom_apps_installation() {
	echo -e "${Cya}➞ [+] Do you want to install telecom apps? ${Whi}"
	read -r answer
	if [ "$answer" == "y" ]; then
		install_telecom_apps
	else
		echo -e "${Red}➞ [-] Skipping telecom apps installation.${Whi}"
	fi
}

# --------
run_themes_installation() {
	echo -e "${Cya}➞ [+] Do you want to install themes and icons? ${Whi}"
	read -r answer
	if [ "$answer" == "y" ]; then
		install_themes
	else
		echo -e "${Red}➞ [-] Skipping themes installation.${Whi}"
	fi
}

# --------
main() {
	echo -e "${Gre}➞ [+] Installing main packages..${Whi}"
	install_main_pkgs

	echo -e "${Gre}➞ [+] Installing terminal packages..${Whi}"
	install_terminal

	run_flatpak_installation

	run_desktop_installation

	run_browser_installation

	run_filemanager_installation

	run_development_installation

	run_monitoring_apps_installation

	echo -e "${Gre}➞ [+] Packages installed successfully.${Whi}"
	echo "$Sperator"
	sleep "$sleep_time"
}

main
