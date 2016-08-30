#!/bin/bash

dotdir="/home/$USER/dotfiles"
update System before starting
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

#zsh installation
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH_CUSTOM/plugins/zsh-history-substring-search


rm ~/.zshrc

#vim

sh $dotdir/installDotfiles.sh
git clone https://github.com/VundleVim/Vundle.vim.git $dotdir/vim/bundle/Vundle.vim
vim -c :PluginInstall -c :q -c :q

sudo npm install -g typescript
cd ~/dotfiles/vim/bundle/YouCompleteMe
./install.py --all



##other installations
yes | sudo sensors-detect
sudo pip install i3ipc
sudo chsh -s /usr/bin/zsh


