# ===============================================================================================
# Title: Arch Linux Setup Script
# Description: This script is part of the dotfiles and is used to install packages on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-05-31
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

echo "$Sperator"

# Install git
echo -e "[${Red}+${Whi}] Installing git if not already installed.."
sudo pacman -S --noconfirm --needed git

echo "$Sperator"

# Install aura AUR helper
echo -e "[${Red}+${Whi}] Installing yay AUR helper.."
cd "$HOME" || return
# Check if ~/src exists
if [ ! -d ~/src ]; then
	mkdir ~/src # Create src directory if it doesn't exist
fi
cd ~/src || return
git clone https://aur.archlinux.org/yay.git yay         # Clone yay from the AUR to ~/src/yay
cd yay || return                                        # Change to yay directory
makepkg -sfci --noconfirm --needed                      # Build and install yay
echo -e "[${Red}+${Whi}] yay version: $(yay --version)" # Print yay version to terminal.

echo "$Sperator"

# Install Flatpak
echo -e "[${Red}+${Whi}] Installing flatpak if not already installed.."
sudo pacman -S --noconfirm --needed flatpak

echo "$Sperator"

# Install pkgs
echo -e "[${Red}+${Whi}] Installing pacman repo packages.."
pacman_packages=""
for repo_pkg in $(cat ~/dotfiles/pkgs/pacman_pkgs); do
	pacman_packages+="$repo_pkg "
done

sudo pacman -S --noconfirm --needed "$pacman_packages"

echo "$Sperator"

# Install pkgs from the AUR
echo -e "[$Cya+$Whi] Installing AUR packages using yay.."
yay_pkgs=""
for aur_pkg in $(cat ~/dotfiles/pkgs/yay_pkgs); do
	yay_pkgs+="$aur_pkg "
done

sudo yay -Acax --noconfirm "$yay_pkgs"

echo "$Sperator"

# Install Flatpak apps
echo -e "[${Red}*{$Whi}] Installing Flatpak apps.."
flatpak_pkgs=""
for flatpak_app in "$(cat ~/dotfiles/pkgs/flatpak_pkgs)"; do
	flatpak_pkgs+="$flatpak_app "
done

flatpak install flathub "$flatpak_pkgs" -y

echo "$Sperator"

# Change shell for eladwy
echo -e "[${Red}*${Whi}] Changing shell for the user to zsh instead of bash"
sudo usermod --shell /usr/bin/zsh "$USER"

echo "$Sperator"

# Clone zsh-autosuggestions and zsh-syntax-highlighting plugins
echo -e "[${Red}*${Whi}] Cloning zsh-autosuggestions plugin.."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo -e "[${Red}*${Whi}] Cloning zsh-syntax-highlighting plugin.."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo "$Sperator"

echo -e "[${Red}*${Whi}] Are You using Lenovo Legion 5 Laptop [y/n](any other answer except y will be considered as No)? "
read -r answer

if [ "$answer" != "${answer#[Yy]}" ]; then
	# Install Lenovo Legion 5 kernel modules for Arch Linux.
	echo -e "[${Red}*${Whi}] Installing Lenovo Legion 5 kernel modules for Arch Linux.."
	cd ~/dotfiles || return
	chmod +x ~/dotfiles/02-setup-lenovo-legion5-modules.sh
	./02-setup-lenovo-legion5-modules.sh
fi

# Goto dotfiles.
# Running next script in dotfiles directory.."
cd ~/dotfiles || return
echo -e "[${Red}*${Whi}] Changing permissions for 03-configs.sh script and making it executable"
chmod +x ~/dotfiles/02-config.sh
echo -e "[${Red}*${Whi}] Running 03-configs.sh script.."
./03-configs.sh
