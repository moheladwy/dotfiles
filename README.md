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

    01-setup-arch.sh # installing the aur helper and flatpak, and the packages in the pacman, aur, and flatpak files (You can open the pkgs files and remove any package you don't want to install).
    
    02-config.sh     # setup the configuration files for the zsh, bash, kitty, nvim, vim, ssh, and any other configurations.
 

## prequisites

Just make sure to read the installation scripts before using it and if there any part you don't like, just comment it (be sure to know what you are doing).

- prequisit package for the installation scripts: `git`

## Installation

```zsh
sudo pacman -S git
cd $HOME
git clone https://github.com/moheladwy/dotfiles.git dotfiles
cd dotfiles
``` 

## Usage

use the following commands to setup the arch system and the configuration files.

```zsh
chmod +x 01-setup-arch.sh # make the script executable.
./01-setup-arch.sh        # call the first script, (do not call 02-config.sh script, because it called by this one).
```

## How to add new dotfiles

```zsh
cd dotfiles
mkdir <dotfile-dir>                 # mkdir vim
cd <dotfile-dir>                    # cd vim
touch <dotfile-name>                # touch .vimrc or copy it if the file already exists somewhere else (just make sure to backup ur old configuration file first before stowing the new one).
stow . -t $HOME/<dotfile-dir>       # stow . -t /home/$USER/vim or any dirctory you would like to stow ur file in it.
```

## How to remove dotfiles

```zsh
cd dotfiles
stow -D <dotfile-dir>                # stow -D vim
```

## License

```

This is my personal dotfiles, you can use it as you want, but you must read the installation scripts first,
I'm not responsible for any damage caused by using it, so use it at your own risk.

```
