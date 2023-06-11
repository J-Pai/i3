#!/bin/bash

i3lock $@
sleep 30
if [ $(pgrep i3lock | wc -l ) -ne 0 ]; then
    xset dpms force off
fi
