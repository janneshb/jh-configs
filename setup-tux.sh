#!/bin/bash

sudo apt update
sudo apt upgrade

# install desktop apps
sudo apt install snapd
sudo snap install code --classic
sudo snap install slack --classic
sudo snap install spotify --classic
sudo snap install alacritty --classic
sudo snap install 1password --classic

stow alacritty

# install rust
curl https://sh.rustup.rs -sSf | sh

# configure Tuxedo OS UI
cp .config/kdeglobals ~/.config/kdeglobals
cp .config/plasma-org.kde.plasma.desktop-appletsrc ~/.config/plasma-org.kde.plasma.desktop-appletsrc

echo
echo Done!
echo Reboot to see changes in effect.
