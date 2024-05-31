# ==============================================================================================================
# Title: Arch Linux (Lenovo Legion 5 Modules) Setup Script
# Description: This script is part of the dotfiles and is used to setup Lenovo Legion 5 Modules on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-05-31
# ==============================================================================================================
Red='\e[0;31m'
Gre='\e[0;32m'
Cya='\e[0;36m'
Whi='\e[0;37m'
Sperator="======================================================================================="

# setup Lenovo Legion 5 - arch Linux modules.
echo -e "➞ [${Red}*${Whi}] Installig and setup the Lenovo Legion 5 modules for arch linux ..."

# Install some dependencies packages for the setup
echo -e "➞ [${Red}*${Whi}] Installig some dependencies packages for the setup!"
sudo pacman -S --needed linux-headers base-devel lm_sensors git dmidecode python-pyqt5 python-yaml python-argcomplete python-darkdetect

# Install the following for installation with DKMS
sudo pacman -S --needed dkms openssl mokutil

echo -e "➞ [${Red}*${Whi}] making directory src in home if not exists..."

if [ ! -d ~/src ]; then
	mkdir -p ~/src
fi
cd ~/src || return

git clone https://github.com/johnfanv2/LenovoLegionLinux.git
cd LenovoLegionLinux/kernel_module || return

make
sudo make reloadmodule

make
sudo make dkms

output=$(sudo dmesg || grep -i "legion_laptop loaded for this device")
good_output="legion_laptop loaded for this device"

if [ "$output" = "$good_output" ]; then
	echo -e "➞ [${Gre}*${Whi}] the modules installed successfully!"
else
	echo -e "➞ [${Red}*${Whi}] the modules couldn't be installed successfully!"
	exit 1
fi

echo "export PATH=$PATH:$HOME/src/LenovoLegionLinux/python/legion_linux/legion_linux" >>~/.zshrc

echo -e "➞ [${Red}*${Whi}] Adding Desktop Entry for the GUI Application..."
touch ~/.local/share/applications/LenovoLegionLinux.desktop
FileContent="
[Desktop Entry]
Name=Lenovo Legion 5 Linux Controller GUI
Exec=sudo ~/src/LenovoLegionLinux/python/legion_linux/legion_linux/legion_gui.py
Version=1.0
Type=Application
Categories=System;
Terminal=true
Icon=~/src/LenovoLegionLinux/python/legion_linux/legion_linux/legion_logo_dark.png
Comment=Control Lenovo Legion 5 Laptops in Arch Linux.
StartupNotify=false
"
echo "$FileContent" >>~/.local/share/applications/LenovoLegionLinux.desktop

echo -e "➞ [${Red}*${Whi}] to use the GUI Controller run: sudo ~/src/LenovoLegionLinux/python/legion_linux/legion_linux/legion_gui.py"
echo -e "➞ [${Red}*${Whi}] or from the desktop menu item created..."
echo -e "➞ [${Gre}*${Whi}] Finished the Lenovo Legion 5 Modules installation for Arch Linux System, for more information visit the github repo for this modules: https://github.com/johnfanv2/LenovoLegionLinux"
