# My-Linux-Dotfiles
This is My Linux Dotfiles.

## prequisites

- you need to have `zsh or bash`, `git`, `zoxide`, and `stow`  installed on your system.

## Installation

```zsh
git clone https://github.com/moheladwy/My-Linux-Dotfiles.git dotfiles
cd dotfiles
``` 

## Usage

```zsh
cd dotfiles/zsh
stow . -t /home/$USER
```

```bash
cd dotfiles/bash
stow . -t /home/$USER
```

## How to add new dotfiles

```zsh
cd dotfiles
mkdir <dotfile-dir>
cd <dotfile-dir>
touch <dotfile-name>
stow . -t /home/$USER/<dotfile-dir>
```

## How to remove dotfiles

```zsh
cd dotfiles
unstow <dotfile-dir>
```

## License

```

This is my personal dotfiles, you can use it as you want, but I'm not responsible for any damage caused by using it, so use it at your own risk.

```