#!/bin/bash

dotdir="/home/$USER/dotfiles"
#update System before starting


#install all the dotfile dependecies
#sudo xbps-install -S $(cat $dotdir/packages)


###vim-plug installation

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
sh $dotdir/setSymLinks.sh
#
dircolors -p > ~/.dircolors
#
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

ln -s /etc/sv/dbus /var/service/
ln -s /etc/sv/cgmanager /var/service/
ln -s /etc/sv/consolekit /var/service/


