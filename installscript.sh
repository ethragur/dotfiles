#!/bin/bash

dotdir="/home/$USER/dotfiles"
#update System before starting
sudo xbps-install -Su


#install all the dotfile dependecies
sudo xbps-install -S $(cat $dotdir/packages)


###vim-plug installation
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo pip3 install neovim
sudo pip install neovim
##
##
##
####other installations
yes | sudo sensors-detect
sudo pip3 install i3ipc
sudo pip3 install fontawesome
sudo chsh -s /bin/zsh
chsh -s /bin/zsh
#
sh $dotdir/installDotfiles.sh
#
dircolors -p > ~/.dircolors
#
