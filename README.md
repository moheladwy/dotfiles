# Dotfiles
This is My Dotfiles for my Arch Linux System, it contains the following configurations:

- `zsh` and `bash` shell configurations.
- `.ssh` configurations.
- `kitty` terminal configurations.
- `.config` directory configurations.
- `home` general directory configurations.
- `nvim` configurations.
- `vim` configurations. 

And it contains the following scripts for installing the `pacman`, `aur`, `flatpak` packages and setup the configuration files: 
01-setup-arch.sh # installing the aur helper and flatpak, and the packages in the pacman, aur, and flatpak files.
02-config.sh # setup the configuration files for the zsh, bash, kitty, nvim, vim, ssh, and eny other configurations.
 

## prequisites

Just make sure to read the installation scripts before using it and if there any part you don't like, just comment it (be sure to know what you are doing).

-prequisit package for the installation scripts: `git`

```sudo pacman -S git```

## Installation

```zsh
git clone https://github.com/moheladwy/dotfiles.git dotfiles
cd dotfiles
``` 
`
## Usage

use the following command to install the dotfiles.

```zsh
chmod +x 01-setup-arch.sh
./01-setup-arch.sh
```

## How to add new dotfiles

```zsh
cd dotfiles
mkdir <dotfile-dir>                 # mkdir vim
cd <dotfile-dir>                    # cd vim
touch <dotfile-name>                # touch .vimrc
stow . -t $HOME/<dotfile-dir>       # stow . -t /home/$USER/vim or any dirctory you would like to stow ur file in it.
```

## How to remove dotfiles

```zsh
cd dotfiles
stow -D <dotfile-dir>                # stow -D vim
```

## License

```

This is my personal dotfiles, you can use it as you want, but you must read the installation scripts first, I'm not responsible for any damage caused by using it, so use it at your own risk.

```
