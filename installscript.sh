#!/bin/bash

dotdir="/home/$USER/dotfiles"
#update System before starting
sudo xbps-install -Su


#install all the dotfile dependecies
sudo xbps-install -S $(cat $dotdir/packages)


###deinvim installation
#wget https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
#mkdir -p $dotdir/vim/deinvim
#sh installer.sh $dotdir/vim/deinvim/
#rm installer.sh
#sudo pip3 install neovim
##
##
##
####other installations
#yes | sudo sensors-detect
#sudo pip3 install i3ipc
#sudo pip3 install fontawesome
#sudo chsh -s /usr/bin/fish
#chsh -s /usr/bin/fish
#
#sh $dotdir/installDotfiles.sh
#
#dircolors -p > ~/.dircolors
#
