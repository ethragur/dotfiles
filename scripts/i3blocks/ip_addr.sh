#!/bin/bash
echo -e "$(ip -o addr show up primary scope global | awk '{print $4;}' | rev | cut -c 4- | rev) \n\n$color3\n"
