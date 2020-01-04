#!/bin/bash

homedir="$HOME"
rootdir='/root'
dotfiles="$homedir/dotfiles"

mkdir -p "$homedir/.config/termite/"
mkdir -p "$homedir/.config/ranger/"
mkdir -p "$homedir/.config/fish/"
mkdir -p "$homedir/.config/nvim/"
mkdir -p "$homedir/.config/kitty/"
mkdir -p "$homedir/.config/mpv/"
mkdir -p "$homedir/.config/rofi/"

ln -sf $dotfiles/vim/init.vim $homedir/.vimrc
ln -sf $dotfiles/vim/init.vim $homedir/.config/nvim/init.vim
ln -sf $dotfiles/xorg/.xinitrc $homedir/.xinitrc
ln -sf $dotfiles/termite/config $homedir/.config/termite/config
ln -sf $dotfiles/fish/config.fish $homedir/.config/fish/config.fish
ln -sf $dotfiles/fish/functions $homedir/.config/fish/functions
ln -sf $dotfiles/ranger/rc.conf $homedir/.config/ranger/rc.conf
ln -sf $dotfiles/zsh/zshrc $homedir/.zshrc
ln -sf $dotfiles/kitty/kitty.conf $homedir/.config/kitty/kitty.conf
ln -sf $dotfiles/mpv/mpv.conf $homedir/.config/mpv/mpv.conf
ln -sf $dotfiles/xorg/xprofile $homedir/.profile
ln -sf $dotfiles/vim/coc-settings.json $homedir/.config/nvim/
ln -sf $dotfiles/rofi/config.rasi $homedir/.config/rofi/config.rasi
ln -sf $/dotfiles/vim/coc-settings.json $homedir/.config/nvim/coc-settings.json

sudo ln -sf $dotfiles/zsh/zshrc $rootdir/.zshrc
sudo ln -sf $dotfiles/vim/init.vim $rootdir/.vimrc

sudo sh -c "if [ -d $rootdir/dotfiles ]; then sudo rm -rf $rootdir/dotfiles; fi"
sudo ln -s $dotfiles $rootdir/dotfiles

