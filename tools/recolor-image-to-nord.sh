#!/usr/bin/env bash
convert $1 -dither FloydSteinberg -colors $2 -remap /home/alex/.config/perso/colors/nord-palette.png $3

