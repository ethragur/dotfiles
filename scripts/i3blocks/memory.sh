#!/bin/bash
echo -e "  $(free -h | grep Mem | awk '{print $7;}')\n\n$color7\n"

