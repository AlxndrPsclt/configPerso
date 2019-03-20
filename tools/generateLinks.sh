#!/usr/bin/env bash
CONFIG_PERSO=$HOME/.config/perso

rm ~/.bashrc
rm ~/.bash_aliases
rm ~/.profile
rm ~/.bash_profile
rm ~/.bash_funcs
rm ~/.bash_completion
rm ~/.bash_logout

ln -s $CONFIG_PERSO/bash_config/bashrc ~/.bashrc
ln -s $CONFIG_PERSO/bash_config/bash_aliases ~/.bash_aliases
source ~/.bash_aliases
ln -s $CONFIG_PERSO/bash_config/profile ~/.profile
ln -s $CONFIG_PERSO/bash_config/bash_funcs ~/.bash_funcs
ln -s $CONFIG_PERSO/bash_config/bash_completion ~/.bash_completion
ln -s $CONFIG_PERSO/bash_config/bash_logout ~/.bash_logout

source $CONFIG_PERSO/tools/generateBashSpecifics.sh

rm -rf ~/.byobu
ln -s $CONFIG_PERSO/byobu/ .byobu

ln -s $CONFIG_PERSO/ssh/rc .ssh/rc
ln -s $CONFIG_PERSO/ssh/change_background_color.sh .ssh/

rm ~/.Xresources
ln -s $CONFIG_PERSO/urxvt/Xresources ~/.Xresources

rm ~/.urxvt
ln -s $CONFIG_PERSO/urxvt ~/.urxvt
ln -s $CONFIG_PERSO/urxvt/reload_xresource.sh ~/.reload_xresource.sh

rm ~/.bash_logout
ln -s $CONFIG_PERSO/i3/ ~/.config/i3

rm ~/.config/qutebrowser
#mkdir qsettings  #Don'tknow what this is for??
ln -s $CONFIG_PERSO/qutebrowser/ ~/.config/qutebrowser

rm ~/.config/i3
ln -s $CONFIG_PERSO/i3/ ~/.config/i3

rm ~/.config/polybar
ln -s $CONFIG_PERSO/polybar/ ~/.config/polybar

rm ~/.config/rofi
ln -s $CONFIG_PERSO/rofi ~/.config/rofi

rm ~/.config/dunst
ln -s $CONFIG_PERSO/dunst ~/.config/dunstrc

rm ~/.config/conky
ln -s $CONFIG_PERSO/conky ~/.config/conky

#Adds completition for in terminal qrcode version of pass
sudo ln -s $CONFIG_PERSO/pass/qrpass /usr/share/bash-completion/completions/qrpass
