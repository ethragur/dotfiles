#!/bin/bash

dotdir="/home/$USER/dotfiles"
#update System before starting
sudo xbps-install -Su


#install all the dotfile dependecies
sudo xbps-install -S $(cat $dotdir/packages)


###vim-plug installation
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install --user neovim
pip3 install --user pywal
##
##
##
####other installations
yes | sudo sensors-detect
pip3 install --user i3ipc
pip3 install --user fontawesome
chsh -s /bin/zsh
#
sh $dotdir/installDotfiles.sh
#
dircolors -p > ~/.dircolors
#
