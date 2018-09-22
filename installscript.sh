#!/bin/bash

dotdir="/home/$USER/dotfiles"
#update System before starting
sudo pacman -Syu


#install all the dotfile dependecies
sudo pacman -S $(cat $dotdir/packages)


##deinvim installation
wget https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
mkdir -p $dotdir/vim/deinvim
sh installer.sh $dotdir/vim/deinvim/
rm installer.sh
sudo pip install neovim
#
#
#
###other installations
yes | sudo sensors-detect
sudo pip install i3ipc
sudo pip install fontawesome
sudo chsh -s /usr/bin/zsh
chsh -s /usr/bin/zsh

sh $dotdir/installDotfiles.sh

dircolors -p > ~/.dircolors

