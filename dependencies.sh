#!/bin/bash 

# install normal dependencies
sudo pacman -Sy tar git curl waybar wofi neovim hyprlock mpv ffmpeg ffmpegthumbnailer ranger neofetch dunst alacritty 

# install cool utils
sudo pacman -Sy pulsemixer wl-clipboard grim xdg-desktop-portal-hyprland slurp playerctl

# install japonese fonts 
sudo pacman -Sy noto-fonts-cjk

# install jetbrains fonts
mkdir /tmp/jetbrains_temp_fonts
cd /tmp/jetbrains_temp_fonts
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
tar -xf JetBrainsMono.tar.xz
rm -f JetBrainsMono.tar.xz
if [ ! -d "$HOME/.local/share/fonts" ]; then
	mkdir $HOME/.local/share/fonts
fi
mv -f * $HOME/.local/share/fonts/
fc-cache

# install paru (aur helper)
sudo pacman -S --needed base-devel
cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
sudo rm -rf /tmp/paru

# install dependencies from aur
paru -Sy ueberzugpp mpvpaper
# remove paru
sudo pacman -R paru paru-debug base-devel

cd $HOME

# remove unused packages
if [ ${#PkgsToRm} -ge 2 ]; then
	sudo pacman -Rsn $PkgsToRm
  	clear
fi

clear
echo "All Finished."
