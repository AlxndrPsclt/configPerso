#!/usr/bin/env bash

rm ~/.bashrc
rm ~/.bash_aliases
rm ~/.profile
rm ~/.bash_profile
rm ~/.bash_funcs
rm ~/.bash_completion
rm ~/.bash_logout

ln -s ~/.config/perso/bash_config/bashrc ~/.bashrc
ln -s ~/.config/perso/bash_config/bash_aliases ~/.bash_aliases
source ~/.bash_aliases
ln -s ~/.config/perso/bash_config/profile ~/.profile
ln -s ~/.config/perso/bash_config/bash_funcs ~/.bash_funcs
ln -s ~/.config/perso/bash_config/bash_completion ~/.bash_completion
ln -s ~/.config/perso/bash_config/bash_logout ~/.bash_logout

source ~/.config/perso/tools/generateBashSpecifics.sh

rm -rf ~/.byobu
ln -s ~/.config/perso/byobu/ .byobu

ln -s ~/.config/perso/ssh/rc .ssh/rc
ln -s ~/.config/perso/ssh/change_background_color.sh .ssh/

rm ~/.Xresources
ln -s ~/.config/perso/urxvt/Xresources ~/.Xresources

rm ~/.urxvt
ln -s ~/.config/perso/urxvt ~/.urxvt
ln -s ~/.config/perso/urxvt/reload_xresource.sh ~/.reload_xresource.sh

rm ~/.config/qutebrowser
mkdir qsettings
ln -s ~/.config/perso/qutebrowser/ ~/.config/qutebrowser
