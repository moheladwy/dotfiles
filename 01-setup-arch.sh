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
	echo -e "➞ [${Gre}+${Whi}] Updating yay.."
	cd ~/src/yay || return
	git pull
	makepkg -sfci --noconfirm --needed
	echo -e "➞ [${Gre}+${Whi}] yay version: $(yay --version)"
else
	echo -e "➞ [${Gre}+${Whi}] yay is not installed."
	cd ~/src || return
	echo -e "➞ [${Gre}+${Whi}] Clone yay from the AUR to ~/src/yay"
	git clone https://aur.archlinux.org/yay.git yay         # Clone yay from the AUR to ~/src/yay
	cd yay || return                                        # Change to yay directory
	makepkg -sfci --noconfirm --needed                      # Build and install yay
	echo -e "➞ [${Gre}+${Whi}] yay version: $(yay --version)" # Print yay version to terminal.
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

# Install pkgs
echo -e "➞ [${Gre}+${Whi}] Installing pacman repo packages.."
pacman_packages=""
for repo_pkg in $(cat ~/dotfiles/pkgs/$pacamn_pkgs_list_name); do
	pacman_packages+="$repo_pkg "
done

sudo pacman -S --noconfirm --needed "$pacman_packages"

# --------

echo "$Sperator"

# --------

# Install pkgs from the AUR
echo -e "➞ [${Gre}+${Whi}] Installing AUR packages using yay.."
yay_pkgs=""
for aur_pkg in $(cat ~/dotfiles/pkgs/$aur_pkgs_list_name); do
	yay_pkgs+="$aur_pkg "
done

yay -cax --noconfirm "$yay_pkgs"

# --------

echo "$Sperator"

# --------

# Install Flatpak apps
echo -e "➞ [${Gre}+${Whi}] Installing Flatpak apps.."
flatpak_pkgs=""
for flatpak_app in $(cat ~/dotfiles/pkgs/$flatpak_pkgs_list_name); do
	flatpak_pkgs+="$flatpak_app "
done

flatpak install flathub "$flatpak_pkgs" -y

# --------

echo "$Sperator"

# --------

# Change shell for eladwy
echo -e "➞ [${Gre}+${Whi}] Changing shell for the user to zsh instead of bash"
sudo usermod --shell /usr/bin/zsh "$USER"

echo -e "➞ [${Gre}+${Whi}] Checking the current shell.."
if [ "$SHELL" != "/usr/bin/zsh" ]; then
	echo -e "${Red}➞ [-] Shell is not zsh, please change it manually."
	echo -e "${Red}➞ [-] Run: chsh -s /usr/bin/zsh"
	echo -e "${Red}➞ [-] Then logout and login again."
	echo -e "${Whi}"
fi

# --------

echo "$Sperator"

# --------

# Clone zsh-autosuggestions and zsh-syntax-highlighting plugins
echo -e "➞ [${Gre}+${Whi}] Cloning zsh-autosuggestions plugin.."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo -e "➞ [${Gre}+${Whi}] Cloning zsh-syntax-highlighting plugin.."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# --------

echo "$Sperator"

# --------

echo -e "${Cya}➞ [+] Are You using Lenovo Legion 5 Laptop [y/n](any other answer except y will be considered as No)? "
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
chmod +x ~/dotfiles/02-config.sh

echo -e "➞ [${Gre}+${Whi}] Running setup config files script.."
./03-configs.sh

echo -e "${Gre}➞ [+] Setup for Arch Linux is done."
echo "$Sperator"

# --------
