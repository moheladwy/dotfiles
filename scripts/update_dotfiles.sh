#!/bin/bash
# This script updates dotfiles repository from .config directory.

# Define the source and destination directories
SOURCE_DIR="$HOME/.config"
DEST_DIR="$HOME/dotfiles/.config"
COMMIT_MESSAGE="updated the last config files on $(date '+%Y-%m-%d %h-%m')"


# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy files from source to destination, preserving the directory structure
cp -r -f --parents "$SOURCE_DIR/hypr" "$DEST_DIR/hypr"
cp -r -f --parents "$SOURCE_DIR/ml4w" "$DEST_DIR/ml4w"
cp -r -f --parents "$SOURCE_DIR/waybar" "$DEST_DIR/waybar"

# Update git repository.
cd "$HOME/dotfiles" || exit 1
git add .
git commit -m "$COMMIT_MESSAGE"
