# ===============================================================================================
# Title: Debian Linux Setup Script
# Description: This script is part of the dotfiles and is used to install packages on Debian Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-07-20
# ===============================================================================================

# --------

# Global Variables
Red='\e[0;31m'
Gre='\e[0;32m'
Cya='\e[0;36m'
Whi='\e[0;37m'
flatpak_pkgs="flatpak_pkgs"
Sperator="======================================================================================="

# --------

echo -e "$Sperator"
echo -e "➞ [${Gre}+${Whi}] Starting setup for Debian Linux:"
echo -e "=============================================="

# --------

# Synchronize package databases
echo -e "➞ [${Gre}+${Whi}] Updating system.."
sudo apt update; sudo apt upgrade -y; sudo apt dist-upgrade -y

# --------

echo "$Sperator"

# --------

# Install git

echo -e "➞ [${Gre}+${Whi}] Installing git if not already installed.."
sudo apt install -y git

# --------

echo "$Sperator"

# --------

# Install flatpak
echo -e "➞ [${Gre}+${Whi}] Installing flatpak if not already installed.."
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# --------

echo "$Sperator"

# --------

# Install flatpak packages
echo -e "➞ [${Gre}+${Whi}] Installing flatpak packages.."
flatpak install -y flathub $(cat "$flatpak_pkgs")

# --------

echo "$Sperator"

# --------

# Install zsh
echo -e "➞ [${Gre}+${Whi}] Installing zsh if not already installed.."
sudo apt install -y zsh

# --------

echo "$Sperator"

# --------

# Change default shell to zsh
echo -e "➞ [${Gre}+${Whi}] Changing default shell to zsh.."
chsh -s $(which zsh) $(whoami)

# --------

echo "$Sperator"

# --------

# Run the zsh setup script
echo -e "➞ [${Gre}+${Whi}] Running zsh setup script.."
cd ~/dotfiles/scripts/debian-scripts/ || return
for script in $(ls); do
	chmod +x $script;
	zsh $script;
done

# --------

echo "$Sperator"

# --------
