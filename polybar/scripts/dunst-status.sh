#!/usr/bin/env bash
# check the paused of dunst

dunst_paused="$( dunstctl is-paused )"

if [[ "$dunst_paused" == true ]]; then
    echo "Dunst ✘"
else
    echo "Dunst ✓"
fi
