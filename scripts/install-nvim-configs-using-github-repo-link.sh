#!/bin/bash

echo "Starting the installation for lazyvim on arch linux :)"

echo "backup all the existing neovim configs!"

echo "check if the ~/.config/nvim exists!"
if [ -d ~/.config/nvim ]; then
  echo "it exists, so a backup will be taken from the director!"
  mv ~/.config/nvim{,.bak}
fi

echo "check if the ~/.local/share/nvim exists!"
if [ -d ~/.local/share/nvim ]; then
  echo "it exists, so a backup will be taken from the director!"
  mv ~/.local/share/nvim{,.bak}
fi

echo "check if the ~/.local/state/nvim exists!"
if [ -d ~/.local/state/nvim ]; then
  echo "it exists, so a backup will be taken from the director!"
  mv ~/.local/state/nvim{,.bak}
fi

echo "check if the ~/.cache/nvim exists!"
if [ -d ~/.cache/nvim ]; then
  echo "it exists, so a backup will be taken from the director!"
  mv ~/.cache/nvim{,.bak}
fi

echo "adding the lazyvim starter configs :)"
git clone --depth 1 $1 ~/.config/nvim

echo "removing the git tree for the starter config!"
rm -rf ~/.config/nvim/.git

echo "start neovim to see the new config :)"
nvim ~/.config/nvim
