#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

sed -i '/FREETYPE_PROPERTIES/s/#//g' /etc/profile.d/freetype2.sh

echo "Please Insert name of your font family (e.g. Droid, Nono, DejaVu, ...): "
read font
echo "Please Insert name of your mono font (e.g. Hack, SourceCodePro, Noto Mono, ...): "
read mono

FONTSTRING="<?xml version=\"1.0\"?>
<!DOCTYPE fontconfig SYSTEM \"fonts.dtd\">
<fontconfig>
    <match>
        <edit mode=\"prepend\" name=\"family\"><string>$font Sans</string></edit>
    </match>
    <match target=\"pattern\">
        <test qual=\"any\" name=\"family\"><string>serif</string></test>
        <edit name=\"family\" mode=\"assign\" binding=\"same\"><string>$font Serif</string></edit>
    </match>
    <match target=\"pattern\">
        <test qual=\"any\" name=\"family\"><string>sans-serif</string></test>
        <edit name=\"family\" mode=\"assign\" binding=\"same\"><string>$font Sans</string></edit>
    </match>
    <match target=\"pattern\">
        <test qual=\"any\" name=\"family\"><string>monospace</string></test>
        <edit name=\"family\" mode=\"assign\" binding=\"same\"><string>$mono</string></edit>
    </match>
</fontconfig>"

touch /etc/fonts/local.conf

echo $FONTSTRING >> /etc/fonts/local.conf

