sudo pacman -S xorg
sudo pacman -S xorg-xinit
sudo pacman -S i3-gaps
sudo pacman -S rvtx-unicode
sudo pacman -S xclip
sudo pacman -S pulseaudio
sudo pacman -S pulseaudio-alsa
sudo pacman -S pulseaudio-bluetooth
sudo pacman -S mpv

#sudo apt-get --yes --force-yes install keepass2

sudo pacman -S wmctrl
sudo pacman -S scrot
xrdb ~/.Xresources


#Setting the compose key
#sudo su
#echo "XKBOPTIONS=compose:ralt" >> /etc/default/keyboard
#exit
#setxkbmap -option compose:ralt

sudo pacman -S tlp
#sudo pacman -S tlp-rdw    #Radio device wizard; carefull

#sudo apt install hibernate
sudo pacman -S dunst
sudo pacman -S conky

sudo pacman -S pamixer

sudo pacman -S qutebrowser


# TODO: install image paletizer https://github.com/pureasbestos/image-palettizer (my own fork to use command line)
# TODO: automate paletizer apply to wallpaper
# TODO: install tools to auto hibernate and lock

# TODO: install qutebrowser python scripting tools https://github.com/hiway/python-qutescript (useless now with virtualenv)
ln -s ~/.config/perso/qutebrowser/userscripts/ ~/.local/share/qutebrowser/userscripts
# Create virtualenvs for qutebrowser scripts execution
. ~/.config/perso/qutebrowser/userscripts/virtualenvs/create_virtualenvs.sh

#Tool allowing QRcode scan from webcam
#sudo apt install zbarcam

#echo '%adm ALL = NOPASSWD: /usr/bin/light' | sudo EDITOR='tee -a' visudo

#echo "Desktop config done."

#todo="$todo>>>>You need to logout then log back in for the compose key to take effect.\n"
