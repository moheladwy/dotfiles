#!/bin/bash

RED='\033[1;31m'    # ${RED}
YELLOW='\033[1;33m' # ${YELLOW}
GREEN='\033[1;32m'  # ${GREEN}
NC='\033[0m'        # ${NC}

if [ "$(id -u)" -eq 0 ]; then
    echo -e "${RED}Error: Do not run this script as root or with sudo.${NC}"
    echo -e "${YELLOW}This script is designed to be run as a regular user with sudo privileges.${NC}"
    echo -e "${YELLOW}It will prompt for sudo rights when necessary during the setup process.${NC}"
    echo -e "${GREEN}Please run the script as a regular user: ./arch-gaming-setup.sh${NC}"
    exit 1
fi

install_amd() {
    echo "Installing AMD GPU drivers and tools"
    # Install AMD drivers and tools
    sudo pacman -S --noconfirm --needed mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
    yay -S --noconfirm --needed lact
}

install_nvidia() {
    echo "Installing Nvidia GPU drivers"
    # Install Nvidia drivers and tools
    sudo pacman -S --noconfirm --needed nvidia-lts nvidia-utils lib32-nvidia-utils nvidia-settings opencl-nvidia nvidia-prime
}

# Function to install gaming packages and utilities
main_installation() {
    echo "Starting the main installation for gaming. This may take some time."

    # Enable TRIM for SSDs
    sudo systemctl enable fstrim.timer

    # Install gaming packages and utilities with pacman
    sudo pacman -S --noconfirm --needed steam lutris wine-staging winetricks \
        gamemode lib32-gamemode giflib lib32-giflib libpng lib32-libpng libldap \
        lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal \
        v4l-utils lib32-v4l-utils libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins \
        alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
        libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader \
        lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gst-plugins-base-libs \
        lib32-gst-plugins-base-libs mangohud lib32-mangohud goverlay gamescope solaar lib32-libpulse xwaylandvideobridge sdl2 lib32-sdl2

    sudo systemctl enable bluetooth.service

    echo "Installing AUR packages with yay..."
    yay -S --noconfirm --needed \
        vkbasalt lib32-vkbasalt proton-ge-custom-bin xone-dkms-git dxvk-bin vkd3d-proton-bin

    echo "Main installation completed."
}

# Main program
echo -e "${YELLOW}This script will configure your system for gaming and install the necessary software.${NC}"
echo -e "${YELLOW}It will automatically download and use yay to install the required software. The multilib repository will also be enabled automatically.${NC}"
echo -e "${YELLOW}For any additional programs and configurations, you will be prompted for confirmation.${NC}"
echo -e "${YELLOW}Please ensure that you have a backup of your important data before proceeding.${NC}"
echo -e "${YELLOW}Do you want to proceed? (y/n)${NC}"
read -r response
if [[ ! "$response" =~ ^[Yy]$ ]]; then
    echo -e "${RED}Installation aborted.${NC}"
    exit 1
fi

# Ask for sudo rights
sudo -v

# Keep sudo rights
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# Update the system.
sudo pacman -Syyu --noconfirm

# Ask about AMD installation
echo -e "${YELLOW}Do you want to install AMD GPU drivers? (y/n)${NC}"
read -r amd_response
if [[ "$amd_response" =~ ^[Yy]$ ]]; then
    install_amd
else
    echo -e "${RED}AMD GPU installation skipped.${NC}"
fi

# Ask about Nvidia installation
echo -e "${YELLOW}Do you want to install Nvidia GPU drivers? (y/n)${NC}"
read -r nvidia_response
if [[ "$nvidia_response" =~ ^[Yy]$ ]]; then
    install_nvidia
else
    echo -e "${RED}Nvidia GPU installation skipped.${NC}"
fi

# Ask about Main installation
echo -e "${YELLOW}Do you want to start the main installation for gaming-related software? (y/n)${NC}"
read -r main_response
if [[ "$main_response" =~ ^[Yy]$ ]]; then
    main_installation
else
    echo -e "${RED}Main installation skipped.${NC}"
fi

echo -e "${YELLOW}Process completed.${NC}"

# Clean up pacman sync files and update the system.
sudo rm -R /var/lib/pacman/sync
sudo pacman -Syy
sudo pacman -Syu --noconfirm

# Ask about restart
echo -e "${GREEN}Script completed succesfully. Do you want to restart your system to apply all changes now?(y/n)${NC}"
read -r restart_response
if [[ "$restart_response" =~ ^[Yy]$ ]]; then
    sudo reboot now
else
    echo -e "${RED}No restart selected${NC}"
fi
