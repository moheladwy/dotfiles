# ======================================================================================================
# Title: Arch Linux (config files) Setup Script.
# Description: This script is part of the dotfiles and is used to setup the config files on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-07-20
# ======================================================================================================

Red='\e[0;31m'
Gre='\e[0;32m'
Whi='\e[0;37m'
Sperator="======================================================================================="

# --------

echo -e "➞ [${Gre}*${Whi}] Starting setup for config files"

# --------

echo -e "➞ [${Gre}*${Whi}] Removing old ~/dotfiles-backup for backing up current configs"

if [ -d ~/dotfiles-backup ]; then
	rm -rf ~/dotfiles-backup
fi

# --------

echo -e "➞ [${Gre}*${Whi}] Backing up existing directories in the new ~/dotfiles-backup directory"

mkdir -p ~/dotfiles-backup
mkdir -p ~/dotfiles-backup/.config
mkdir -p ~/dotfiles-backup/home
mkdir -p ~/dotfiles-backup/zsh
mkdir -p ~/dotfiles-backup/bash
mkdir -p ~/dotfiles-backup/vim

# --------

echo -e "➞ [${Gre}*${Whi}] Moving existing directories or files in ~/ and ~/.config to ~/dotfiles-backup"

cd ~ || return

for dir in $(ls ~/dotfiles/.config); do
	if [ -d "$dir" ] || [ -f "$dir" ]; then
		mv ~/.config/"$dir" ~/dotfiles-backup/.config
	fi
done

for dir in $(ls ~/dotfiles/zsh); do
	if [ -d "$dir" ] || [ -f "$dir" ]; then
		mv ~/"$dir" ~/dotfiles-backup/zsh
	fi
done

for dir in $(ls ~/dotfiles/bash); do
	if [ -d "$dir" ] || [ -f "$dir" ]; then
		mv ~/"$dir" ~/dotfiles-backup/bash
	fi
done

for dir in $(ls ~/dotfiles/vim); do
	if [ -d "$dir" ] || [ -f "$dir" ]; then
		mv ~/"$dir" ~/dotfiles-backup/vim
	fi
done

for dir in $(ls ~/dotfiles/home); do
	if [ -d "$dir" ] || [ -f "$dir" ]; then
		mv ~/"$dir" ~/dotfiles-backup/home
	fi
done

# --------

echo -e "➞ [${Gre}*${Whi}] Backups saved in ~/dotfiles-backup"
echo -e "➞ [${Gre}*${Whi}] Symlinking directories and files of the new dotfiles using stow command"
echo -e "➞ [${Gre}*${Whi}] make sure to have stow installed on your system"
sudo pacman -S --noconfirm --needed stow

# --------

echo -e "➞ [${Gre}*${Whi}] Symlinking directories in .config directory"
cd ~/dotfiles/.config || return
stow . -t ~/.config

# --------

echo -e "➞ [${Gre}*${Whi}] Symlinking directories in home directory"
cd ~/dotfiles/home || return
stow . -t ~

# --------

echo -e "➞ [${Gre}*${Whi}] Symlinking files in zsh directory"
cd ~/dotfiles/zsh || return
stow . -t ~

# --------

echo -e "➞ [${Gre}*${Whi}] Symlinking files in bash directory"
cd ~/dotfiles/bash || return
stow . -t ~

# --------

echo -e "➞ [${Gre}*${Whi}] Symlinking files for the vim directory"
cd ~/dotfiles/vim || return
stow . -t ~

# --------

echo -e "${Gre}➞ [*] Finished setting up config files!"
echo -e "${Gre}➞ [*] Exiting ./03-configs.sh script!"
echo -e "${Whi}"

# --------
