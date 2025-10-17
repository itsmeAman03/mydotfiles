#! /usr/bin/zsh

if [[ ! $(pidof rofi) ]]; then
    rofi -show drun 
else
    pkill rofi
fi
