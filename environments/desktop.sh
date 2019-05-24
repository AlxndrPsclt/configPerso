#sudo apt-get --yes --force-yes install vlc
#sudo apt-get --yes --force-yes install chromium-browser

sudo apt-get --yes --force-yes install xclip

#sudo apt-get --yes --force-yes install keepass2

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

sudo apt install libboost-program-options-dev
old_dir=$(pwd)
cd /tmp
git clone https://github.com/cdemoulins/pamixer.git
cd pamixer
make
sudo mv pamixer /usr/bin/
cd $old_dir

# TODO: install image paletizer https://github.com/pureasbestos/image-palettizer (my own fork to use command line)
# TODO: automate paletizer apply to wallpaper
# TODO: install tools to auto hibernate and lock

# TODO: install qutebrowser python scripting tools https://github.com/hiway/python-qutescript (useless now with virtualenv)
ln -s ~/.config/perso/qutebrowser/userscripts/ ~/.local/share/qutebrowser/userscripts
# Create virtualenvs for qutebrowser scripts execution
. ~/.config/perso/qutebrowser/userscripts/virtualenvs/create_virtualenvs.sh

#Tool allowing QRcode scan from webcam
sudo apt install zbarcam

echo '%adm ALL = NOPASSWD: /usr/bin/light' | sudo EDITOR='tee -a' visudo

echo "Desktop config done."

todo="$todo>>>>You need to logout then log back in for the compose key to take effect.\n"
