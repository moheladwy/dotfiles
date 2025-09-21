#!/bin/bash
# This script updates dotfiles repository from .config directory.

# Define the source and destination directories
SOURCE_DIR="$HOME/.mydotfiles/com.ml4w.dotfiles.stable/.config"
DEST_DIR="$HOME/dotfiles/.config"
COMMIT_MESSAGE="updated the last config files on $(date '+%Y-%m-%d %h-%m')"


# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy files from source to destination, preserving the directory structure
cp -r -f "$SOURCE_DIR/hypr" "$DEST_DIR/"
cp -r -f "$SOURCE_DIR/ml4w" "$DEST_DIR/"
cp -r -f "$SOURCE_DIR/waybar" "$DEST_DIR/"

# ASK Whether to commit changes or not.
read -r -p "Do you want to commit the changes? (y/n): " user_input
if [[ "$user_input" != "y" ]]; then
    echo "Changes not committed."
    exit 0
fi

# Update git repository.
cd "$HOME/dotfiles" || exit 1
git add .
git commit -m "$COMMIT_MESSAGE"
