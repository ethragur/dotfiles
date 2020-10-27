
function feh_browser () {
    sh $DOTFILES/scripts/feh_browser.sh $1 -F -Z
}

function mcd () {
    mkdir -p $1
    cd $1
}


function x () {
case "$1" in
    *.zip)
       unzip $1
       ;;
    *.tar.bz2)
       tar xjf $1
       ;;
    *.tar.gz)
       tar xzf $1
       ;;
    *.bz2)
       bunzip2 $1
       ;;
    *.rar)
       unrar x $1
       ;;
    *.gz)
       gunzip $1
       ;;
    *.tar)
       tar xf $1
       ;;
    *.tbz2)
       tar xjf $1
       ;;
    *.tgz)
       tar xzf $1
       ;;
    *.Z)
       uncompress $1
       ;;
    *.7z)
       7z x $1
       ;;
    *.xz)
       tar xvf $1
       ;;
    *)
        echo "Cannot extract file"
        return -1
        ;;
esac
}


function xd () {
    x $1 && rm $1
}

function reload () {
    source $HOME/.zshrc
}

function enable () {
    sudo ln -s /etc/sv/$1 /var/service
}

function goodnight () {
    sleep 1h && sudo poweroff
}

function mega64 () {
    megadl $(echo "$1" | base64 --decode)
}

function win_reboot () {
    sudo efibootmgr -n 0000
    sudo reboot
}
