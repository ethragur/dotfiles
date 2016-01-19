#!/bin/bash

homedir='/home/effi'
dotdir="$homedir/dotfiles"

mkdir -p "$homedir/.config/fish/functions/"
ln -sf $dotdir/i3/config $homedir/.i3/config 
ln -sf $dotdir/ranger/rc.conf $homedir/.config/ranger/rc.conf
ln -sf $dotdir/urxvt/Xdefaults/ $homedir/.Xdefaults
ln -sf $dotdir/fish/config.fish $homedir/.config/fish/config.fish
ln -sf $dotdir/vim $homedir/.config/nvim
ln -sf $dotdir/.xinitrc $homedir/.xinitrc
ln -sf $dotdir/termite/config $homedir/.config/termite/config
ln -sf "$dotdir/fish/functions/fish_prompt.fish"  "$homedir/.config/fish/functions/"

