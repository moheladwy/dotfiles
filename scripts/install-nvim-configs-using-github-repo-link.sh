#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <github-repo-url>"
    echo "Example: $0 https://github.com/LazyVim/starter.git"
    exit 1
fi

for cmd in git nvim; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "Error: $cmd is required but not installed." >&2
        exit 1
    fi
done

echo "Starting the installation for lazyvim on arch linux :)"

echo "backup all the existing neovim configs!"

echo "check if the ~/.config/nvim exists!"
if [ -d ~/.config/nvim ]; then
  echo "it exists, so a backup will be taken from the director!"
  mv ~/.config/nvim "$HOME/.config/nvim.bak.$(date +%Y%m%d%H%M%S)"
fi

echo "check if the ~/.local/share/nvim exists!"
if [ -d ~/.local/share/nvim ]; then
  echo "it exists, so a backup will be taken from the director!"
  mv ~/.local/share/nvim "$HOME/.local/share/nvim.bak.$(date +%Y%m%d%H%M%S)"
fi

echo "check if the ~/.local/state/nvim exists!"
if [ -d ~/.local/state/nvim ]; then
  echo "it exists, so a backup will be taken from the director!"
  mv ~/.local/state/nvim "$HOME/.local/state/nvim.bak.$(date +%Y%m%d%H%M%S)"
fi

echo "check if the ~/.cache/nvim exists!"
if [ -d ~/.cache/nvim ]; then
  echo "it exists, so a backup will be taken from the director!"
  mv ~/.cache/nvim "$HOME/.cache/nvim.bak.$(date +%Y%m%d%H%M%S)"
fi

echo "adding the lazyvim starter configs :)"
git clone --depth 1 "$1" ~/.config/nvim

echo "removing the git tree for the starter config!"
rm -rf ~/.config/nvim/.git

echo "start neovim to see the new config :)"
nvim ~/.config/nvim
