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
welcome_message() {
	echo -e "$Sperator"
	echo -e "${Gre}➞ [+] Starting setup for Arch Linux:${Whi}"
	echo -e "$Sperator"
	sleep "$sleep_time"
}

# --------
claim_sudo() {
	# Ask for sudo rights
	sudo -v

	# Keep sudo rights
	while true; do
		sudo -n true
		sleep 60
		kill -0 "$$" || exit
	done 2>/dev/null &
}

# --------
enable_multilib() {
	if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
		echo "Enabling multilib repository..."
		sudo tee -a /etc/pacman.conf >/dev/null <<EOT

[multilib]
Include = /etc/pacman.d/mirrorlist
EOT
		echo "Multilib repository has been enabled."
	else
		echo "Multilib repository is already enabled."
	fi
}

# --------
update_system() {
	echo -e "${Gre}➞ [+] Updating system..${Whi}"
	sudo pacman -Syyu --noconfirm
	sudo pacman -Fyu --noconfirm
	echo "$Sperator"
	sleep "$sleep_time"
}

# --------
install_pkgs() {
	echo -e "${Gre}➞ [+] Installing packages stage..${Whi}"
	cd "$dotfiles_dir" || return
	chmod +x "$dotfiles_dir/$arch_scripts_dir/install-pkgs.sh"
	"$dotfiles_dir/$arch_scripts_dir/install-pkgs.sh"

	echo "$Sperator"
	sleep $sleep_time
}

# --------
change_shell() {
	echo -e "${Cya}➞ [+] Do you want to change the shell for the user to zsh instead of bash [y/n]? ${Whi}"
	read -r REPLY

	if [[ $REPLY =~ ^[Yy]$ ]]; then
		sudo chsh -s $(which zsh) $(whoami)
		echo -e "${Gre}➞ [+] Shell changed to zsh successfully (you need to logout and login again to see the changes).${Whi}"
		sleep $sleep_time
	else
		echo -e "${Red}➞ [+] Shell not changed.${Whi}"
		sleep $sleep_time
	fi
}

# --------
install_zsh_plugins() {
	# Clone zsh-autosuggestions and zsh-syntax-highlighting plugins
	echo -e "${Gre}➞ [+] Cloning zsh-autosuggestions plugin..${Whi}"
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

	echo -e "${Gre}➞ [+] Cloning zsh-syntax-highlighting plugin..${Whi}"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

	echo -e "${Gre}➞ [+] zsh-autosuggestions and zsh-syntax-highlighting plugins cloned successfully.${Whi}"
	echo "$Sperator"
	sleep $sleep_time
}

# --------
setup_lenovo_legion5_modules() {
	echo -e "${Cya}➞ [+] Are You using Lenovo Legion 5 Laptop [y/n]? ${Whi}"
	read -r answer

	if [ "$answer" != "${answer#[Yy]}" ]; then
		# Install Lenovo Legion 5 kernel modules for Arch Linux.
		echo -e "${Cya}➞ [+] Installing Lenovo Legion 5 kernel modules for Arch Linux..${Whi}"
		cd "$dotfiles_dir" || return
		chmod +x "$dotfiles_dir/$arch_scripts_dir/setup-lenovo-legion5-modules.sh"
		"$dotfiles_dir/$arch_scripts_dir/setup-lenovo-legion5-modules.sh"
	fi

	echo "$Sperator"
	sleep $sleep_time
}

# --------
setup_kvm() {
	echo -e "${Cya}➞ [+] Do you want to setup KVM for Arch Linux [y/n]? ${Whi}"
	read -r answer

	if [ "$answer" != "${answer#[Yy]}" ]; then
		chmod +x "$dotfiles_dir/$arch_scripts_dir/setup-kvm.sh"
		"$dotfiles_dir/$arch_scripts_dir/setup-kvm.sh"
	fi

	echo "$Sperator"
	sleep "$sleep_time"
}

# --------
setup_configuration_files() {
	cd "$dotfiles_dir" || return
	echo -e "${Gre}➞ [+] Changing permissions for setup config files script and making it executable${Whi}"
	chmod +x "$dotfiles_dir/$arch_scripts_dir/setup-configs.sh"

	echo -e "${Gre}➞ [+] Running setup config files script..${Whi}"
	"$dotfiles_dir/$arch_scripts_dir/setup-configs.sh"

	echo "$Sperator"
	sleep $sleep_time
}

# --------
final_message() {
	echo -e "${Gre}➞ [+] Setup for Arch Linux is done.${Whi}"
	echo -e "${Gre}➞ [+] Please logout and login again to see the changes.${Whi}"
	echo "$Sperator"
	sleep "$sleep_time"
}

# --------
main() {
	welcome_message
	claim_sudo
	enable_multilib
	update_system
	install_pkgs
	change_shell
	install_zsh_plugins
	setup_lenovo_legion5_modules
	setup_kvm
	setup_configuration_files
	update_system
	final_message
}

main
