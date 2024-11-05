#!/bin/bash

RED='\033[1;31m'    # ${RED}
YELLOW='\033[1;33m' # ${YELLOW}
GREEN='\033[1;32m'  # ${GREEN}
NC='\033[0m'        # ${NC}

echo -e "${GREEN}Uninstalling gaming dependencies...${NC}"

uninstall_gaming_dependencies() {
    # List of packages to potentially remove
    packages=(steam lutris winetricks gamemode giflib lib32-giflib libpng lib32-libpng libldap lib32-libpulse \
              lib32-libldap mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils \
              libgpg-error lib32-libgpg-error libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite \
              lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses libxslt lib32-libxslt libva \
              lib32-libva gst-plugins-base-libs lib32-gst-plugins-base-libs mangohud lib32-mangohud goverlay gamescope)

    # Check and remove only orphaned packages
    for pkg in "${packages[@]}"; do
        if yay -Qi $pkg &>/dev/null; then  # Check if package is installed
            if ! yay -Qi $pkg | grep -q "Required By     : None"; then  # Check if no other packages require it
                echo -e "${YELLOW}Skipping $pkg as it is required by other packages.${NC}"
            else
                yay -Rns $pkg --noconfirm
                echo -e "${GREEN}Removed $pkg${NC}"
            fi
        else
            echo -e "${RED}$pkg is not installed.${NC}"
        fi
    done

    echo -e "${GREEN}Uninstallation of safe packages completed.${NC}"
}

uninstall_gaming_dependencies_prompt() {
    echo -e "${YELLOW}Do you want to uninstall gaming dependencies? (y/n)${NC}"
    read -r uninstall_response
    if [[ "$uninstall_response" =~ ^[Yy]$ ]]; then
        uninstall_gaming_dependencies
    else
        echo -e "${RED}Uninstallation skipped.${NC}"
    fi

    echo -e "${YELLOW}Process completed.${NC}"
}

uninstall_amdgpu_driver() {
    yay -Rns --noconfirm mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader lact
}

uninstall_amdgpu_driver_prompt() {
    echo -e "${YELLOW}Do you want to uninstall amdgpu driver? (y/n)${NC}"
    read -r uninstall_response
    if [[ "$uninstall_response" =~ ^[Yy]$ ]]; then
        uninstall_amdgpu_driver
    else
        echo -e "${RED}Uninstallation skipped.${NC}"
    fi

    echo -e "${YELLOW}Process completed.${NC}"
}

uninstall_nvidia_driver() {
    sudo pacman -Rns --noconfirm nvidia-lts nvidia-utils lib32-nvidia-utils nvidia-settings opencl-nvidia nvidia-prime
}

uninstall_nvidia_driver_prompt() {
    echo -e "${YELLOW}Do you want to uninstall nvidia driver? (y/n)${NC}"
    read -r uninstall_response
    if [[ "$uninstall_response" =~ ^[Yy]$ ]]; then
        uninstall_nvidia_driver
    else
        echo -e "${RED}Uninstallation skipped.${NC}"
    fi

    echo -e "${YELLOW}Process completed.${NC}"
}

cleanup() {
    sudo rm -R /var/lib/pacman/sync
    sudo pacman -Syy
    sudo pacman -Syu --noconfirm --needed
    yay -Syy --noconfirm --needed
}

reboot_prompt() {
    echo -e "${GREEN}Script completed succesfully. Do you want to restart your system to apply all changes now?(y/n)${NC}"
    read -r restart_response
    if [[ "$restart_response" =~ ^[Yy]$ ]]; then
        sudo reboot now
    else
        echo -e "${RED}No restart selected${NC}"
    fi
}

# Uninstall gaming dependencies if installed.
uninstall_gaming_dependencies_prompt

# Uninstall amdgpu driver if installed.
uninstall_amdgpu_driver_prompt

# Uninstall nvidia driver if installed.
uninstall_nvidia_driver_prompt

# Cleanup pacman sync files and update the system.
cleanup

# Reboot the system to apply all changes.
reboot_prompt
