#!/bin/bash
source ~/.cache/wal/colors.sh
echo -e "  \n\n$color1\n"

if [ "$BLOCK_BUTTON" = "1" ]
	then sudo systemctl suspend
fi
