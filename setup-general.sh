#!/bin/bash

sudo apt update
sudo apt upgrade


# install essentials
#
sudo apt install -y \
  build-essential \
  can-utils \
  curl \
  git \
  htop \
  ncdu \
  meld \
  mlocate \
  peek \
  pv \
  python-is-python3 \
  ripgrep \
  socat \
  stow \
  tlp \
  tree \
  tmux \
  units \
  wget \
  xcape \
  xclip \
  zsh

# git config
#
stow git
rm ~/.gitconfig
cp git/.gitconfig ~/
git config --global init.defaultBranch main

# tmux config
#
stow tmux
./get-tmux-rst.sh


# nvim setup
#
set -xe

if [ $(uname -m) = x86_64 ]; then
  # Install latest appimage
  NVIM_PATH=~/software/nvim.appimage
  NVIM_DIR=$(dirname $NVIM_PATH)
  mkdir -p $NVIM_DIR
  wget https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage -P $NVIM_DIR
  chmod u+x $NVIM_PATH
  sudo update-alternatives --install /usr/bin/ex ex "${NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vi vi "${NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/view view "${NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vim vim "${NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/nvim nvim "${NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vimdiff vimdiff "${NVIM_PATH}" 110
else
  # Install old version, but should be fine.
  sudo apt install -y neovim
  # This should automatically set up vi and vim alternatives.
  # Might need old vim and vi to be uninstaled.
  # Todo - could add a check and an error
fi

# clear old configs (for debugging or non-fresh setup):
#rm -rf ~/.config/nvim/bundle
#rm ~/.config/nvim

stow nvim
mkdir -p ~/.config/nvim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

nvim --headless +PluginInstall +qa


# zsh setup
#
stow zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode


# fzf setup
#
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc


# set zsh as standard console
chsh -s $(which zsh)

echo
echo Done!
echo Reboot to see changes in effect.

