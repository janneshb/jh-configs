#!/bin/bash

sudo apt update
sudo apt upgrade

echo "emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'" | sudo tee -a /etc/zsh/zprofile

# install desktop apps
sudo apt install snapd
sudo snap install code --classic
sudo snap install spotify --classic
sudo apt install terminator
sudo snap install 1password --classic

sudo snap install slack
sudo snap install signal-desktop

# install rust
curl https://sh.rustup.rs -sSf | sh

# configure Tuxedo OS UI
cp .config/kdeglobals ~/.config/kdeglobals
cp .config/plasma-org.kde.plasma.desktop-appletsrc ~/.config/plasma-org.kde.plasma.desktop-appletsrc

echo
echo Done!
echo Reboot to see changes in effect.
