#!/bin/bash 


# install paru (aur helper)
sudo pacman -S --needed base-devel git
cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
sudo rm -rf /tmp/paru
cd $HOME


# install apps
sudo pacman -Sy waybar wofi neovim hyprlock hyprpaper mpv alacritty neofetch dunst ranger
paru -S mpvpaper

# install dependencies
sudo pacman -S ffmpeg ffmpegthumbnailer
paru -S ueberzugpp

# install fonts
sudo pacman -Sy ttf-font-awesome ttf-jetbrains-mono-nerd ttf-jetbrains-mono
fc-cache


# install japonese fonts (optional)
sudo pacman -Sy noto-fonts-cjk
fc-cache

# install cool utils (optional)
sudo pacman -Sy pulsemixer btop xdg-desktop-portal-hyprland wl-clipboard grim slurp playerctl


# remove unused packages
if [ ${#PkgsToRm} -ge 2 ]; then
	sudo pacman -Rsn $PkgsToRm
fi

clear
echo "All Finished."
