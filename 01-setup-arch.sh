Red='\e[0;31m';
Gre='\e[0;32m';
Cya='\e[0;36m';
Whi='\e[0;37m';

# Synchronize package databases
echo -e "[${Red}*${Whi}] Updating system.."
sudo pacman -Syu

# Install aura AUR helper
echo -e "[${Red}+${Whi}] Installing aura"
git clone https://aur.archlinux.org/aura-bin.git /tmp/aura-git-cloned
cd /tmp/aura-git-cloned/
makepkg -sfci --noconfirm --needed

# Install pkgs
echo -e "[${Red}+${Whi}] Installing repo packages"
for repo_pkg in $(cat ~/dotfiles/pkgs/pacman_pkgs)
do
	sudo pacman -S --noconfirm --needed $repo_pkg
done

# Install pkgs from the AUR
echo -e "[${Cya}+${Whi}] Installing AUR packages"
for aur_pkg in $(cat ~/dotfiles/pkgs/aur_pkgs)
do
	sudo aura -Acax --noconfirm $aur_pkg
done

# Change shell for eladwy
echo -e "[${Red}*${Whi}] Changing shell for user"
sudo usermod --shell /usr/bin/zsh eladwy 

chmod +x ./02-configs.sh
./02-configs.sh
