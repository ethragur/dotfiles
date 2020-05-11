#!/usr/bin/bash

flatpak override --user --filesystem=/proc com.discordapp.Discord
flatpak override --user --filesystem=/home/effi/Drive com.valvesoftware.Steam
flatpak override --user --filesystem=/home/effi/Downloads com.skype.Client
flatpak override --user --filesystem=/home/effi/Documents com.skype.Client
flatpak override --user --filesystem=/home/effi/Downloads com.discordapp.Discord
