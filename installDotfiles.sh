#!/bin/bash

homedir='/home/effi'
rootdir='/root'
dotdir="$homedir/dotfiles"

mkdir -p "$homedir/.config/fish/functions/"
mkdir -p "$homedir/.i3/"
mkdir -p "$homedir/.config/termite/"
mkdir -p "$homedir/.config/ranger/"
sudo mkdir -p "$rootdir/.config/fish/functions/"
sudo mkdir -p "$rootdir/.i3/"
sudo mkdir -p "$rootdir/.config/termite/"
sudo mkdir -p "$rootdir/.config/ranger/"

ln -sf $dotdir/i3/config $homedir/.i3/config 
ln -sf $dotdir/ranger/rc.conf $homedir/.config/ranger/rc.conf
ln -sf $dotdir/urxvt/Xdefaults/ $homedir/.Xdefaults
ln -sf $dotdir/fish/config.fish $homedir/.config/fish/config.fish
ln -sf $dotdir/vim $homedir/.config/nvim
ln -sf $dotdir/.xinitrc $homedir/.xinitrc
ln -sf $dotdir/termite/config $homedir/.config/termite/config
ln -sf "$dotdir/fish/functions/fish_prompt.fish"  "$homedir/.config/fish/functions/"

sudo ln -sf $dotdir/i3/config $rootdir/.i3/config 
sudo ln -sf $dotdir/ranger/rc.conf $rootdir/.config/ranger/rc.conf
sudo ln -sf $dotdir/urxvt/Xdefaults/ $rootdir/.Xdefaults
sudo ln -sf $dotdir/fish/config.fish $rootdir/.config/fish/config.fish
sudo ln -sf $dotdir/vim $rootdir/.config/nvim
sudo ln -sf "$dotdir/fish/functions/fish_prompt.fish"  "$rootdir/.config/fish/functions/"


