uninstall_gaming_dependencies() {
    # List of packages to potentially remove
    packages=(steam lutris winetricks gamemode lib32-gamemode giflib lib32-giflib libpng lib32-libpng libldap \
              lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils \
              libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo \
              lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama \
              ncurses lib32-ncurses libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs \
              lib32-gst-plugins-base-libs mangohud lib32-mangohud goverlay gamescope lib32-libpulse vkbasalt \
              lib32-vkbasalt proton-ge-custom-bin dxvk-bin vkd3d-proton-bin)

    for pkg in "${packages[@]}"; do
        # Check if removing the package would break dependencies
        if ! sudo pacman -Rdd "$pkg" --noconfirm --print > /dev/null 2>&1; then
            echo -e "${RED}Skipping $pkg due to dependency issues.${NC}"
        else
            # Actually remove the package if no dependency issues
            sudo pacman -Rns "$pkg" --noconfirm
            echo -e "${GREEN}Removed $pkg${NC}"
        fi
    done

    echo -e "${GREEN}Uninstallation completed.${NC}"
} 