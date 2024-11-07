#! /bin/bash
# ===============================================================================================
# Title: Arch Linux Setup Script
# Description: This script is part of the dotfiles and is used to install packages on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-11-06
# ===============================================================================================

# Global Variables
export Red='\e[0;31m'
export Gre='\e[0;32m'
export Cya='\e[0;36m'
export Whi='\e[0;37m'

export sleep_time=2

export pkgs_dir="pkgs"
export zsh_dir="zsh"
export bash_dir="bash"
export kvm_dir="kvm"
export etc_dir="etc"
export home_dir="home"
export config_dir=".config"
export vim_dir="vim"
export arch_scripts_dir="scripts/arch-scripts"
export source_dir="$HOME/src"
export dotfiles_dir="$HOME/dotfiles"

export all_pkgs="$pkgs_dir/all_pkgs"
export terminal_pkgs="$pkgs_dir/terminal_pkgs"
export hyprland_pkgs="$pkgs_dir/hyprland_pkgs"
export browsers_pkgs="$pkgs_dir/browsers_pkgs"
export filemanagers_pkgs="$pkgs_dir/filemanagers_pkgs"
export theme_pkgs="$pkgs_dir/theme_pkgs"
export monitors_pkgs="$pkgs_dir/monitors_pkgs"
export kde_pkgs="$pkgs_dir/kde_pkgs"
export nvidia_pkgs="$pkgs_dir/nvidia_pkgs"
export kvm_pkgs="$pkgs_dir/kvm_pkgs"
export devops_pkgs="$pkgs_dir/devops_pkgs"
export node_pkgs="$pkgs_dir/node_pkgs"
export java_pkgs="$pkgs_dir/java_pkgs"
export docker_pkgs="$pkgs_dir/docker_pkgs"
export dotnet_pkgs="$pkgs_dir/dotnet_pkgs"
export IDEs_pkgs="$pkgs_dir/IDEs_pkgs"
export telecom_pkgs="$pkgs_dir/telecom_pkgs"
export flatpak_pkgs="$pkgs_dir/flatpak_pkgs"
export Sperator="======================================================================================="
