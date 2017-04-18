#!/bin/bash

dotdir="/home/$USER/dotfiles"
update System before starting
sudo pacman -Syu

#pacaur
#gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
#git clone https://aur.archlinux.org/cower.git /tmp/cower
#git clone https://aur.archlinux.org/pacaur.git /tmp/pacaur
#cd /tmp/cower/
#makepkg -s -i 
#cd /tmp/pacaur/
#makepkg -s -i 


#install all the dotfile dependecies
#pacaur -S $(cat $dotdir/dependency.txt)

#zsh installation
#vim

#sh $dotdir/installDotfiles.sh

##deinvim installation
#wget https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
#mkdir -p $dotdir/deinvim
#sh installer.sh $dotdir/deinvim/
#rm installer.sh
#
#
#
###other installations
#yes | sudo sensors-detect
#sudo pip install i3ipc
sudo chsh -s /usr/bin/fish
chsh -s /usr/bin/fish


