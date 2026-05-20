#!/bin/bash
# ==============================================================================================================
# Title: Arch Linux (Lenovo Legion 5 Modules) Setup Script
# Description: This script is part of the dotfiles and is used to setup Lenovo Legion 5 Modules on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-07-20
# ==============================================================================================================
set -euo pipefail

source "$HOME/dotfiles/scripts/env_variables.sh"

if ! command -v pacman &>/dev/null; then
	echo "Error: This script is for Arch Linux only." >&2
	exit 1
fi

# setup Lenovo Legion 5 - arch Linux modules.
echo -e "➞ [${Gre}*${Whi}] Installing and setup the Lenovo Legion 5 modules for arch linux ..."

# Install some dependencies packages for the setup
echo -e "➞ [${Gre}*${Whi}] Installing some dependencies packages for the setup!"
sudo pacman -S --needed linux-headers base-devel lm_sensors git dmidecode python-pyqt5 python-yaml python-argcomplete python-darkdetect dkms openssl mokutil

echo -e "➞ [${Gre}*${Whi}] making directory src in home if not exists..."
mkdir -p "$source_dir"
cd "$source_dir" || exit 1

if [[ ! -d "$source_dir/LenovoLegionLinux" ]]; then
	echo -e "➞ [${Gre}*${Whi}] Cloning the Lenovo Legion 5 modules from the github repo..."
	git clone https://github.com/johnfanv2/LenovoLegionLinux.git || exit 1
fi

cd LenovoLegionLinux/kernel_module || exit 1

make || exit 1
sudo make reloadmodule

sudo make dkms

sudo dmesg >>~/dmesg-file
echo -e "➞ [${Gre}*${Whi}] Checking the kernel module in the ~/dmesg-file to see if it loaded correctly..."

echo -e "➞ [${Gre}*${Whi}] Adding Desktop Entry for the GUI Application..."
FileContent="
[Desktop Entry]
Categories=System;
Comment[en_US]=Control Lenovo Legion 5 Laptops with reverse engineered ACPI calls.
Comment=Control Lenovo Laptop with reverse engineered ACPI calls.
Exec=$HOME/src/LenovoLegionLinux/python/legion_linux/legion_linux/legion_gui.py
GenericName[en_US]=Control Lenovo Legion 5 Laptop
GenericName=Control Lenovo Legion 5 Laptop
Icon=$HOME/src/LenovoLegionLinux/python/legion_linux/legion_linux/legion_logo_light.png
MimeType=
Name[en_US]=Lenovo Legion 5 Controller
Name=Lenovo Legion 5 Controller
Path=$HOME/src/LenovoLegionLinux/python/legion_linux/legion_linux/
StartupNotify=true
Terminal=true
TerminalOptions=
Type=Application
Version=1.0
X-KDE-SubstituteUID=true
X-KDE-Username=root
"
echo "$FileContent" >~/.local/share/applications/LenovoLegionLinux.desktop

echo -e "${Gre}➞ [*] to use the GUI Controller run: sudo $HOME/src/LenovoLegionLinux/python/legion_linux/legion_linux/legion_gui.py"
echo -e "${Gre}➞ [*] or from the desktop menu item created..."
echo -e "${Gre}➞ [*] Finished the Lenovo Legion 5 Modules installation for Arch Linux System"
echo -e "${Gre}➞ [*] for more information visit the github repo for this modules: https://github.com/johnfanv2/LenovoLegionLinux"
echo -e "${Gre}➞ [*] Exiting 02-setup-lenovo-legion5-modules.sh script!"
echo -e "${Whi}"
