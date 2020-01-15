#!/bin/bash

rootdir='/root'
dotfiles="$HOME/dotfiles"

mkdir -p "$HOME/.config/termite/"
mkdir -p "$HOME/.config/ranger/"
mkdir -p "$HOME/.config/fish/"
mkdir -p "$HOME/.config/nvim/"
mkdir -p "$HOME/.config/kitty/"
mkdir -p "$HOME/.config/mpv/"
mkdir -p "$HOME/.config/rofi/"

ln -sf $dotfiles/vim/init.vim $HOME/.vimrc
ln -sf $dotfiles/vim/init.vim $HOME/.config/nvim/init.vim
ln -sf $dotfiles/xorg/.xinitrc $HOME/.xinitrc
ln -sf $dotfiles/termite/config $HOME/.config/termite/config
ln -sf $dotfiles/fish/config.fish $HOME/.config/fish/config.fish
ln -sf $dotfiles/fish/functions $HOME/.config/fish/functions
ln -sf $dotfiles/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln -sf $dotfiles/zsh/zshrc $HOME/.zshrc
ln -sf $dotfiles/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
ln -sf $dotfiles/mpv/mpv.conf $HOME/.config/mpv/mpv.conf
ln -sf $dotfiles/xorg/xprofile $HOME/.profile
ln -sf $dotfiles/vim/coc-settings.json $HOME/.config/nvim/
ln -sf $dotfiles/rofi/config.rasi $HOME/.config/rofi/config.rasi
ln -sf $/dotfiles/vim/coc-settings.json $HOME/.config/nvim/coc-settings.json

sudo ln -sf $dotfiles/zsh/zshrc $rootdir/.zshrc
sudo ln -sf $dotfiles/vim/init.vim $rootdir/.vimrc

sudo sh -c "if [ -d $rootdir/dotfiles ]; then sudo rm -rf $rootdir/dotfiles; fi"
sudo ln -s $dotfiles $rootdir/dotfiles

