# Dotfiles
This is My Linux Dotfiles for my linux desktop, it contains the following configurations:

- `zsh` and `bash` shell configurations.
- `.ssh` configurations.
- `kitty` terminal configurations.
- `.config` directory configurations.
- `home` general directory configurations.

## prequisites

- you need to have `zsh` or `bash`, `git`, `zoxide` if you use zsh, and `stow`  installed on your system.

## Installation

```zsh
git clone https://github.com/moheladwy/dotfiles.git dotfiles
cd dotfiles
``` 

## Usage

use the following command to install the dotfiles into your home directory, depending on your shell.

for `zsh`:
```zsh
cd dotfiles/zsh
stow . -t /home/$USER
```

for `bash`:
```bash
cd dotfiles/bash
stow . -t /home/$USER
```

## How to add new dotfiles

```zsh
cd dotfiles
mkdir <dotfile-dir>                 # mkdir vim
cd <dotfile-dir>                    # cd vim
touch <dotfile-name>                # touch .vimrc
stow . -t /home/$USER/<dotfile-dir> # stow . -t /home/$USER/vim or any dirctory you would like to stow ur file in it.
```

## How to remove dotfiles

```zsh
cd dotfiles
stow -D <dotfile-dir>                # stow -D vim
```

## License

```

This is my personal dotfiles, you can use it as you want, 

but I'm not responsible for any damage caused by using it, so use it at your own risk.

```
