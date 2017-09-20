#!/bin/bash

dotdir="/home/$USER/dotfiles"
#update System before starting
sudo pacman -Syu

#pacaur
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
git clone https://aur.archlinux.org/cower.git /tmp/cower
git clone https://aur.archlinux.org/pacaur.git /tmp/pacaur
cd /tmp/cower/
makepkg -s -i 
cd /tmp/pacaur/
makepkg -s -i 


#install all the dotfile dependecies
pacaur -S $(cat $dotdir/dependency.txt)


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
sudo chsh -s /usr/bin/fish
chsh -s /usr/bin/fish

#sh $dotdir/installDotfiles.sh

dircolors -p > ~/.dircolors

