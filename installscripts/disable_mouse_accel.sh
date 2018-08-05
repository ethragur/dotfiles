#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "THIS IS ONLY FOR XINPUT"

XSTRING="Section \"InputClass\"
        Identifier \"My Mouse\"
        Driver \"libinput\"
        MatchIsPointer \"yes\"
        Option \"AccelProfile\" \"flat\"
EndSection"

touch /etc/X11/xorg.conf.d/50-mouse-acceleration.conf

echo $XSTRING >> /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
