#!/bin/bash

State=$(pgrep openvpn)

if [ -z "$State" ]; then
	sudo openvpn --config /home/effi/.config/openvpn/effi-pc.ovpn
else
	sudo pkill openvpn
fi

