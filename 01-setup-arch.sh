# ===============================================================================================
# Title: Arch Linux Setup Script
# Description: This script is part of the dotfiles and is used to install packages on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-04-21
# ===============================================================================================
Red='\e[0;31m'
Gre='\e[0;32m'
Cya='\e[0;36m'
Whi='\e[0;37m'
Sperator="======================================================================================="

# Synchronize package databases
echo -e "[${Red}*${Whi}] Updating system.."
sudo pacman -Syu
sudo pacamn -Fyu

echo ${Sperator}

# Install git
echo -e "[${Red}+${Whi}] Installing git"
sudo pacman -S --noconfirm --needed git

echo ${Sperator}

# Install aura AUR helper
echo -e "[${Red}+${Whi}] Installing yay AUR helper.."
cd $HOME
# Check if ~/src exists
if [! -d ~/src]; then
	mkdir ~/src # Create src directory if it doesn't exist
fi
cd ~/src
git clone https://aur.archlinux.org/yay.git yay         # Clone yay from the AUR to ~/src/yay
cd yay                                                  # Change to yay directory
makepkg -sfci --noconfirm --needed                      # Build and install yay
echo -e "[${Red}+${Whi}] yay version: $(yay --version)" # Print yay version to terminal.

echo ${Sperator}

# Install Flatpak
echo -e "[${Red}+${Whi}] Installing flatpak"
sudo pacman -S --noconfirm --needed flatpak

echo ${Sperator}

# Install pkgs
echo -e "[${Red}+${Whi}] Installing pacman repo packages.."
for repo_pkg in $(cat ~/dotfiles/pkgs/pacman_pkgs); do
	sudo pacman -S --noconfirm --needed $repo_pkg
done

echo ${Sperator}

# Install pkgs from the AUR
echo -e "[${Cya}+${Whi}] Installing AUR packages using yay.."
for aur_pkg in $(cat ~/dotfiles/pkgs/yay_pkgs); do
	sudo yay -Acax --noconfirm $aur_pkg
done

echo ${Sperator}

# Install Flatpak apps
echo -e "[${Red}*${Whi}] Installing Flatpak apps.."
for flatpak_app in $(cat ~/dotfiles/pkgs/flatpak_pkgs); do
	flatpak install flathub $flatpak_app -y
done

echo ${Sperator}

# Change shell for eladwy
echo -e "[${Red}*${Whi}] Changing shell for user eladwy to zsh instead of bash"
sudo usermod --shell /usr/bin/zsh eladwy

echo ${Sperator}

# Goto dotfiles.
# Running next script in dotfiles directory.."
cd ~/dotfiles
echo -e "[${Red}*${Whi}] Changing permissions for 02-config.sh script and making it executable"
chmod +x ~/dotfiles/02-config.sh
echo -e "[${Red}*${Whi}] Running 02-config.sh script.."
./02-config.sh
