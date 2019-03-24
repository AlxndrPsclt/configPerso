sudo apt-get --yes --force-yes install vlc
#sudo apt-get --yes --force-yes install chromium-browser

#sudo apt-get --yes --force-yes install xclip

sudo apt-get --yes --force-yes install keepass2

#sudo apt-get --yes --force-yes install gnome-tweak-tool

sudo apt-get --yes --force-yes install rxvt-unicode-256color
sudo apt-get --yes --force-yes install wmctrl
sudo apt-get --yes --force-yes install scrot
xrdb ~/.Xresources

#sudo apt-get --yes --force-yes install tomboy



#Setting the compose key
sudo su
echo "XKBOPTIONS=compose:ralt" >> /etc/default/keyboard
exit
setxkbmap -option compose:ralt

sudo add-apt-repository -y ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install --yes --force-yes tlp tlp-rdw

sudo apt install hibernate
sudo apt install dunst
sudo apt install conky

echo '%adm ALL = NOPASSWD: /usr/bin/light' | sudo EDITOR='tee -a' visudo

echo "Desktop config done."

todo="$todo>>>>You need to logout then log back in for the compose key to take effect.\n"
