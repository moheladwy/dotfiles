# ======================================================================================================
# Title: Arch Linux (config files) Setup Script.
# Description: This script is part of the dotfiles and is used to setup the config files on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-05-31
# ======================================================================================================

Red='\e[0;31m'
Gre='\e[0;32m'
Whi='\e[0;37m'
Sperator="======================================================================================="

# --------

echo -e "➞ [${Gre}*${Whi}] Starting setup for config files"

# --------

echo -e "➞ [${Red}*${Whi}] Removing old ~/dotfiles-backup for backing up current configs"

if [ -d ~/dotfiles-backup ]; then
	rm -rf ~/dotfiles-backup
fi

# --------

echo -e "➞ [${Gre}*${Whi}] Backing up existing directories in the new ~/dotfiles-backup directory"

mkdir -p ~/dotfiles-backup
mkdir -p ~/dotfiles-backup/config
mkdir -p ~/dotfiles-backup/home
mkdir -p ~/dotfiles-backup/zsh
mkdir -p ~/dotfiles-backup/bash
mkdir -p ~/dotfiles-backup/vim

# --------

echo -e "➞ [${Gre}*${Whi}] Moving existing directories or files in ~/.config to ~/dotfiles-backup/config"

cd ~/dotfiles || return

for dir in "$(find .config -maxdepth 1 -mindepth 1 | awk -F "/" '{print $NF}')"; do
	mv ~/.config/"$dir" ~/dotfiles-backup/config
done

# --------

echo -e "➞ [${Gre}*${Whi}] Moving existing directories or files in ~/ to ~/dotfiles-backup/home"

for dir in "$(find home -mindepth 1 -maxdepth 1 | awk -F "/" '{print $NF}')"; do
	mv ~/"$dir" ~/dotfiles-backup/home
done

# --------

echo -e "➞ [${Gre}*${Whi}] Moving existing directories or files in ~/ to ~/dotfiles-backup/zsh"

for dir in "$(find zsh -mindepth 1 -maxdepth 1 | awk -F "/" '{print $NF}')"; do
	mv ~/"$dir" ~/dotfiles-backup/zsh
done

# --------

echo -e "➞ [${Gre}*${Whi}] Moving existing directories or files in ~/ to ~/dotfiles-backup/bash"

for dir in "$(find bash -mindepth 1 -maxdepth 1 | awk -F "/" '{print $NF}')"; do
	mv ~/"$dir" ~/dotfiles-backup/bash
done

# --------

echo -e "➞ [${Gre}*${Whi}] Moving existing directories or files in ~/ to ~/dotfiles-backup/vim"

for dir in "$(find vim -mindepth 1 -maxdepth 1 | awk -F "/" '{print $NF}')"; do
	mv ~/"$dir" ~/dotfiles-backup/vim
done

# --------

echo -e "➞ [${Gre}*${Whi}] Backups saved in ~/dotfiles-backup"
echo -e "➞ [${Gre}*${Whi}] Symlinking directories and files of the new dotfiles"

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

echo -e "➞ [${Gre}*${Whi}] Finished setting up configs"

# --------
