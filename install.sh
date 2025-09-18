#!/bin/bash

echo "Installing..."

echo "yay and sddm are not installed. Installing..."
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Installation - Packages ------------------------------------------------------------------------------------

echo "Installing packages..."
yay -S --needed - < ~/hypr/packages

# Enable Services -----------------------------------------------------------------------------------------


sudo systemctl enable sddm bluetooth.service
sudo systemctl start bluetooth.service
swww-daemon

# Config ---------------------------------------------------------------------------------------------------

echo "Installing config files"
cp -r ./config/* $HOME/.config/

sudo chmod +x $HOME/.config/scripts/audio.sh $HOME/.config/scripts/brightness.sh $HOME/.config/scripts/confirm.sh $HOME/.config/scripts/downloadAudio.sh $HOME/.config/scripts/downloadMusic.sh $HOME/.config/scripts/downloadVideo.sh $HOME/.config/scripts/kittypadding.sh $HOME/.config/scripts/paperchange $HOME/.config/scripts/paperchange-backend $HOME/.config/scripts/reload.sh
mkdir -p $HOME/Pictures/wallpapers
cp ./wallpapers/wallpaper.png $HOME/Pictures/wallpapers
$HOME/.config/scripts/paperchange
