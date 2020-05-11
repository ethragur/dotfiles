#!/bin/bash

dotfiles="$HOME/dotfiles"

ln -sf $dotfiles/xorg/.xinitrc $HOME/.xinitrc
ln -sf $dotfiles/xorg/xprofile $HOME/.profile
ln -sf $dotfiles/user-dirs.dirs $HOME/.config/
ln -sf $dotfiles/rofi $HOME/.config/
ln -sf $dotfiles/alacritty $HOME/.config/
ln -sf $dotfiles/vim $HOME/.config/nvim
ln -sf $dotfiles/zsh/zshrc $HOME/.zshrc
ln -sf $dotfiles/mpv $HOME/.config/
ln -sf $dotfiles/sway $HOME/.config/
ln -sf $dotfiles/wal $HOME/.config/
ln -sf $dotfiles/polybar $HOME/.config/
ln -sf $dotfiles/dunst $HOME/.config/
