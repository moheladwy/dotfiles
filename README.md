# My-Linux-Dotfiles
This is My Linux Dotfiles.

## prequisites

- you need to have `zsh` or `bash`, `git`, `zoxide` if you use zsh, and `stow`  installed on your system.

## Installation

```zsh
git clone https://github.com/moheladwy/My-Linux-Dotfiles.git dotfiles
cd dotfiles
``` 

## Usage

use the following command to install the dotfiles into your home directory. depending on your shell.

```zsh
cd dotfiles/zsh
stow . -t /home/$USER
```

or

```bash
cd dotfiles/bash
stow . -t /home/$USER
```

## How to add new dotfiles

```zsh
cd dotfiles
mkdir <dotfile-dir>                 # e.g. vim
cd <dotfile-dir>                    # cd vim
touch <dotfile-name>                # e.g. .vimrc
stow . -t /home/$USER/<dotfile-dir> # stow . -t /home/$USER/vim
```

## How to remove dotfiles

```zsh
cd dotfiles
unstow <dotfile-dir>                # unstow vim
```

## License

```

This is my personal dotfiles, you can use it as you want, but I'm not responsible for any damage caused by using it, so use it at your own risk.

```