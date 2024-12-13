#!/bin/bash
# ========================================================================================================================
# Author:
#     Mohamed Hussein Al-Adawy
# Description:
#     This script takes a screenshot of a selected area, extracts the text from the image, and copies it to the clipboard.
#     The script uses grimblast for Wayland and scrot for X11 to take screenshots.
#     The script uses tesseract to extract text from the image.
#     The script uses wl-copy and cliphist for Wayland and xclip for X11 to copy the extracted text to the clipboard.
#     The script uses a python script to extract text from the image.
#     The script requires the following packages to be installed:
#         - python
#         - python-pip
#         - tesseract
#         - grimblast or scrot
#         - wl-clipboard or xclip
#         - cliphist
# ========================================================================================================================
sys_requirements=(
    tesseract
    tesseract-data-eng
    tesseract-data-ara
    python
    python-pip
    python-numpy
    python-pillow
    python-pytesseract
    python-opencv
)
wayland_session_apps=(
    grimblast
    wl-clipboard
    cliphist
    rofi-wayland
)
x11_session_apps=(
    xclip
    scrot
    rofi
)

install_requirements() {
    yay -S --noconfirm --needed "${sys_requirements[@]}"

    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        yay -S --noconfirm --needed "${wayland_session_apps[@]}"
    else
        yay -S --noconfirm --needed "${x11_session_apps[@]}"
    fi
}

install_requirements