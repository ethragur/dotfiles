#!/bin/bash
echo -e "$(ifconfig $(ip addr show | grep wlp | head -n 1 | awk '{print $2;}' | rev | cut -c 2- | rev) | grep inet | awk 'NR==1' | awk '{print $2;}') \n\n$color3\n"
