# ===============================================================================================
# Title: Arch Linux Setup Script
# Description: This script is part of the dotfiles and is used to install packages on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-07-20
# ===============================================================================================

# --------

# Global Variables
Red='\e[0;31m'
Gre='\e[0;32m'
Cya='\e[0;36m'
Whi='\e[0;37m'
pacamn_pkgs_list_name="pacman_pkgs"
aur_pkgs_list_name="yay_pkgs"
flatpak_pkgs_list_name="flatpak_pkgs"
Sperator="======================================================================================="

# --------

echo -e "$Sperator"
echo -e "➞ [${Gre}+${Whi}] Starting setup for Arch Linux:"
echo -e "=============================================="

# --------

# Synchronize package databases
echo -e "➞ [${Gre}+${Whi}] Updating system.."
sudo pacman -Syu
sudo pacamn -Fyu

# --------

echo "$Sperator"

# --------

# Install git
echo -e "➞ [${Gre}+${Whi}] Installing git if not already installed.."
sudo pacman -S --noconfirm --needed git

# --------

echo "$Sperator"

# --------

# Install aura AUR helper
echo -e "➞ [${Gre}+${Whi}] Installing yay AUR helper.."
cd "$HOME" || return

# Check if ~/src exists
if [ ! -d ~/src ]; then
	mkdir -p ~/src # Create src directory if it doesn't exist
fi

if [ -d ~/src/yay ]; then
	echo -e "➞ [${Gre}+${Whi}] yay is already installed."
	echo -e "➞ [${Gre}+${Whi}] yay version: $(yay --version)"
else
	echo -e "➞ [${Gre}+${Whi}] yay is not installed."
	cd ~/src || return
	echo -e "➞ [${Gre}+${Whi}] Clone yay from the AUR to ~/src/yay"
	git clone https://aur.archlinux.org/yay.git yay         	# Clone yay from the AUR to ~/src/yay
	cd yay || return                                        	# Change to yay directory
	makepkg -sfci --noconfirm --needed                      	# Build and install yay
	echo -e "➞ [${Gre}+${Whi}] yay version: $(yay --version)" 	# Print yay version to terminal.
fi

# --------

echo "$Sperator"

# --------

# Install Flatpak
echo -e "➞ [${Gre}+${Whi}] Installing flatpak if not already installed.."
sudo pacman -S --noconfirm --needed flatpak

# --------

echo "$Sperator"

# --------

# Install pkgs from the AUR
echo -e "➞ [${Cya}?${Whi}] Do you want to install all the AUR packages in the ~/dotfiles/pkgs/yay_pkgs file (you can remove the packages you do not need from the file) [y/n]? "
read -r REPLY

if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo -e "➞ [${Gre}+${Whi}] Installing AUR packages using yay.."
	yay -S --needed --noconfirm $(cat ~/dotfiles/pkgs/$aur_pkgs_list_name)
	sleep 5
fi

# --------

echo "$Sperator"

# --------

# Install Flatpak apps

echo -e "➞ [${Cya}?${Whi}] Do you want to install all the Flatpak apps in the ~/dotfiles/pkgs/flatpak_pkgs file (you can remove the apps you do not need from the file) [y/n]? "
read -r REPLY

if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo -e "➞ [${Gre}+${Whi}] Installing Flatpak apps.."
	flatpak install -y flathub $(cat ~/dotfiles/pkgs/$flatpak_pkgs_list_name)
	sleep 5
fi

# --------

echo "$Sperator"

# --------

# Change shell for eladwy

echo -e "➞ [${Gre}+${Whi}] Do you want to change the shell for the user to zsh instead of bash [y/n]? "
read -r REPLY

if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo -e "➞ [${Gre}+${Whi}] Changing shell for the user to zsh instead of bash"
	sudo chsh -s $(which zsh) $(whoami)
	echo -e "➞ [${Gre}+${Whi}] The shell for the user is now: $(echo $SHELL)"
	sleep 5
	# --------

	echo "$Sperator"

	# --------

	# Clone zsh-autosuggestions and zsh-syntax-highlighting plugins
	echo -e "➞ [${Gre}+${Whi}] Cloning zsh-autosuggestions plugin.."
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

	echo -e "➞ [${Gre}+${Whi}] Cloning zsh-syntax-highlighting plugin.."
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

# --------

echo "$Sperator"

# --------

echo -e "${Cya}➞ [+] Are You using Lenovo Legion 5 Laptop [y/n]? "
read -r answer

echo -e "${Whi}"

if [ "$answer" != "${answer#[Yy]}" ]; then
	# Install Lenovo Legion 5 kernel modules for Arch Linux.
	echo -e "➞ [${Red}+${Whi}] Installing Lenovo Legion 5 kernel modules for Arch Linux.."
	cd ~/dotfiles || return
	chmod +x ~/dotfiles/02-setup-lenovo-legion5-modules.sh
	./02-setup-lenovo-legion5-modules.sh
fi

# --------

echo "$Sperator"

# --------

# Goto dotfiles.
# Running next script in dotfiles directory.."
cd ~/dotfiles || return
echo -e "➞ [${Gre}+${Whi}] Changing permissions for setup config files script and making it executable"
chmod +x ~/dotfiles/scripts/arch-scripts/03-configs.sh

echo -e "➞ [${Gre}+${Whi}] Running setup config files script.."
zsh ~/dotfiles/scripts/arch-scripts/03-configs.sh

echo -e "${Gre}➞ [+] Setup for Arch Linux is done."
echo -e "${Gre}➞ [+] Please logout and login again to see the changes."
echo -e "${Gre}➞ [+] Exiting 01-setup-arch.sh script!"
echo -e "${Whi}"
echo "$Sperator"

# --------
