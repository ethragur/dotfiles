#!/bin/bash
echo -e "  $(sensors -u coretemp-isa-0000 | grep input | awk '{print $2;}' | awk '{s+=$1} END {print s/NR}'  | sed 's/\..*//')°\n\n$color12\n"
