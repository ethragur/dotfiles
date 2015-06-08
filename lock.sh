#!/bin/bash
scrot /tmp/screenshot.png
convert /tmp/screenshot.png -scale 10% -scale 1000% /tmp/screenshot.png
convert /tmp/screenshot.png -blur 0x5 /tmp/screenshotblur.png
i3lock -i /tmp/screenshotblur.png
