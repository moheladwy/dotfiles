#! /bin/bash
# ======================================================================================================
# Title: Arch Linux (config files) Setup Script.
# Description: This script is part of the dotfiles and is used to setup the config files on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-11-06
# ======================================================================================================

source "$HOME/dotfiles/scripts/env_variables.sh"

# --------
echo -e "${Gre}➞ [*] Starting setup for config files${Whi}"

backup_configs() {
  echo -e "${Cya}➞ [*] Backup configs in ~/.config/backup${Whi}"
  cd "$HOME/dotfiles/.config" || exit 1

  # Create backup directory if it doesn't exist
  mkdir -p ~/.config/backup

  # Only backup files that exist in both source and destination
  for file in *; do
    if [ -e "$HOME/.config/$file" ]; then
      mv "$file" ~/.config/backup/
    fi
  done

  echo -e "${Gre}➞ [*] Done Backup configs${Whi}"
  echo -e "$Sperator"
  sleep "$sleep_time"
}

# --------
stow_configs() {
  echo -e "${Cya}➞ [*] Setup configs${Whi}"
  cd "$HOME/dotfiles/.config" || exit 1
  stow . -t ~/.config --adopt
  echo -e "${Gre}➞ [*] Done Setup configs${Whi}"
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
main() {
  backup_configs
  stow_configs
  stow_vim
  if [[ "$SHELL" == "/usr/bin/zsh" ]]; then
    stow_zsh
  fi
  echo -e "${Gre}➞ [*] Done Setup all configs${Whi}"
  echo -e "$Sperator"
  sleep "$sleep_time"
}

# --------
main
