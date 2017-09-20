#!/bin/bash

sudo systemctl stop systemd-networkd
sudo systemctl stop wpa_supplicant@wlp17s0f3u4
sudo systemctl stop systemd-resolved
sudo systemctl start systemd-networkd
sudo systemctl start wpa_supplicant@wlp17s0f3u4
sudo systemctl start systemd-resolved
