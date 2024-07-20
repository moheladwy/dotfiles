# ==============================================================================================================
# Title: Arch Linux (Lenovo Legion 5 Modules) Setup Script
# Description: This script is part of the dotfiles and is used to setup Lenovo Legion 5 Modules on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-07-20
# ==============================================================================================================
Red='\e[0;31m'
Gre='\e[0;32m'
Whi='\e[0;37m'

# setup Lenovo Legion 5 - arch Linux modules.
echo -e "➞ [${Gre}*${Whi}] Installig and setup the Lenovo Legion 5 modules for arch linux ..."

# Install some dependencies packages for the setup
echo -e "➞ [${Gre}*${Whi}] Installig some dependencies packages for the setup!"
sudo pacman -S --needed linux-headers base-devel lm_sensors git dmidecode python-pyqt5 python-yaml python-argcomplete python-darkdetect

# Install the following for installation with DKMS
sudo pacman -S --needed dkms openssl mokutil

echo -e "➞ [${Gre}*${Whi}] making directory src in home if not exists..."

if [ ! -d ~/src ]; then
	mkdir -p ~/src
fi
cd ~/src || return

echo -e "➞ [${Gre}*${Whi}] Cloning the Lenovo Legion 5 modules from the github repo..."
git clone https://github.com/johnfanv2/LenovoLegionLinux.git
cd LenovoLegionLinux/kernel_module || return

make
sudo make reloadmodule

make
sudo make dkms

sudo dmesg >> ~/dmesg-file
wanted_output="legion_laptop loaded for this device"
output=$(grep -ixo "$wanted_output" ~/dmesg-file)

if [ "$output" = "$wanted_output" ]; then
	echo -e "➞ [${Gre}*${Whi}] the modules installed successfully!"
	rm ~/dmesg-file
else
	echo -e "${Red}➞ [*] the modules couldn't be installed successfully!"
	echo -e "${Red}➞ [*] Please check the output of the dmesg command from dmesg-file to see what went wrong!"
	echo -e "${Red}➞ [*] or check the github repo for more information: https://github.com/johnfanv2/LenovoLegionLinux.git"
	echo -e "${Red}➞ [*] Exiting the script!"
	echo -e "${Whi}"
	exit 1
fi

echo -e "➞ [${Gre}*${Whi}] Adding Desktop Entry for the GUI Application..."

FileContent="
[Desktop Entry]
Categories=System;
Comment[en_US]=Control Lenovo Legion 5 Laptops with reverse engineered ACPI calls.
Comment=Control Lenovo Laptop with reverse engineered ACPI calls.
Exec=$USER/src/LenovoLegionLinux/python/legion_linux/legion_linux/legion_gui.py
GenericName[en_US]=Control Lenovo Legion 5 Laptop
GenericName=Control Lenovo Legion 5 Laptop
Icon=$USER/src/LenovoLegionLinux/python/legion_linux/legion_linux/legion_logo_light.png
MimeType=
Name[en_US]=Lenovo Legion 5 Controller
Name=Lenovo Legion 5 Controller
Path=$USER/src/LenovoLegionLinux/python/legion_linux/legion_linux/
StartupNotify=true
Terminal=true
TerminalOptions=
Type=Application
Version=1.0
X-KDE-SubstituteUID=true
X-KDE-Username=root
"
echo "$FileContent" >~/.local/share/applications/LenovoLegionLinux.desktop

echo -e "${Gre}➞ [*] to use the GUI Controller run: sudo ~/src/LenovoLegionLinux/python/legion_linux/legion_linux/legion_gui.py"
echo -e "${Gre}➞ [*] or from the desktop menu item created..."
echo -e "${Gre}➞ [*] Finished the Lenovo Legion 5 Modules installation for Arch Linux System"
echo -e "${Gre}➞ [*] for more information visit the github repo for this modules: https://github.com/johnfanv2/LenovoLegionLinux"
echo -e "${Gre}➞ [*] Exiting ./02-setup-lenovo-legion5-modules.sh script!"
echo -e "${Whi}"
