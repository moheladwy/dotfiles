#!/bin/bash
# ======================================================================================================
# Title: Arch Linux (config files) Setup Script.
# Description: This script is part of the dotfiles and is used to setup the config files on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-11-06
# ======================================================================================================
set -euo pipefail

source "$HOME/dotfiles/scripts/env_variables.sh"

# --------
backup_configs() {
	echo -e "${Cya}➞ [*] Backup configs in ~/.config/backup${Whi}"
	mkdir -p ~/.config/backup

	# Only backup files that exist in both source and destination
	for file in "$HOME/dotfiles/config"/*; do
		base=$(basename "$file")
		if [ -e "$HOME/.config/$base" ]; then
			cp -r "$HOME/.config/$base" "$HOME/.config/backup/"
		fi
	done

	echo -e "${Gre}➞ [*] Done Backup configs${Whi}"
	echo -e "$Sperator"
	sleep "$sleep_time"
}

# --------
stow_vim() {
	echo -e "${Cya}➞ [*] Setup vim${Whi}"
	cd "$HOME/dotfiles/vim" || exit 1
	stow . -t ~ --adopt
	echo -e "${Gre}➞ [*] Done Setup vim${Whi}"
	echo -e "$Sperator"
	sleep "$sleep_time"
}

# --------
stow_zsh() {
	echo -e "${Cya}➞ [*] Setup zsh${Whi}"
	cd "$HOME/dotfiles/zsh" || exit 1
	stow . -t ~ --adopt
	echo -e "${Gre}➞ [*] Done Setup zsh${Whi}"
	echo -e "$Sperator"
	sleep "$sleep_time"
}

# --------
stow_kitty() {
	echo -e "${Cya}➞ [*] Setup kitty${Whi}"
	cd "$HOME/dotfiles/config/kitty" || exit 1
	mkdir -p ~/.config/kitty
	if stow . -t ~/.config/kitty --adopt; then
		echo -e "${Gre}➞ [*] Done Setup kitty${Whi}"
	else
		echo -e "${Red}➞ [!] Failed to stow kitty config.${Whi}"
	fi
	echo -e "$Sperator"
	sleep "$sleep_time"
}

# --------
main() {
	echo -e "${Gre}➞ [*] Starting setup for config files${Whi}"
	backup_configs
	stow_vim
	stow_kitty
	if [[ "$(basename "$SHELL")" == "zsh" ]]; then
		stow_zsh
	fi
	echo -e "${Gre}➞ [*] Done Setup all configs${Whi}"
	echo -e "$Sperator"
	sleep "$sleep_time"
}

# --------
main
