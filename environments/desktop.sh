sudo apt-get --yes --force-yes install vlc
sudo apt-get --yes --force-yes install chromium-browser

sudo apt-get --yes --force-yes install xclip

sudo apt-get --yes --force-yes install keepass2

sudo apt-get --yes --force-yes install gnome-tweak-tool

sudo apt-get --yes --force-yes install tomboy

#Graphical themes
sudo apt-get --yes --force-yes install gnome-themes-standard gtk2-engines-murrine
cd /tmp && wget -qO - https://github.com/nana-4/materia-theme/archive/master.tar.gz | tar xz
cd materia-theme-master
sudo ./install.sh

#sudo add-apt-repository -y ppa:dyatlov-igor/materia-theme
#sudo apt update
#sudo apt install --yes --force-yes materia-theme

gsettings set org.gnome.desktop.interface gtk-theme 'Materia-compact'

#Icon themes
sudo add-apt-repository -y ppa:snwh/pulp
sudo apt-get update
sudo apt-get instal --yes --force-yes paper-icon-theme
sudo apt-get instal --yes --force-yes paper-cursor-theme
sudo apt-get instal --yes --force-yes paper-cursor-theme

sudo add-apt-repository -y ppa:daniruiz/flat-remix
sudo apt-get update
sudo apt-get install --yes --force-yes flat-remix

gsettings set org.gnome.desktop.interface icon-theme 'Flat-Remix-Light'

#Installing workspacetodock gnome-shell extension
if [ ! -d "/tmp/workspace2dock" ]; then
mkdir /tmp/workspace2dock
git clone https://github.com/passingthru67/workspaces-to-dock.git /tmp/workspace2dock
fi
if [ ! -d "~/.local/share/gnome-shell/extensions" ]; then
	mkdir ~/.local/share/gnome-shell/extensions
fi
cp -r /tmp/workspace2dock/workspaces-to-dock@passingthru67.gmail.com ~/.local/share/gnome-shell/extensions/

#Configuring workspace2dock
sudo cp ~/.local/share/gnome-shell/extensions/workspaces-to-dock@passingthru67.gmail.com/schemas/org.gnome.shell.extensions.workspaces-to-dock.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
gsettings set org.gnome.shell.extensions.workspaces-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.workspaces-to-dock horizontal-workspace-switching true

#gnome-shell --replace

gnome-shell-extension-tool -e workspaces-to-dock@passingthru67.gmail.com

#Modifying the system sleep timeout
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 900
gsettings set org.gnome.desktop.session idle-delay 900
gsettings set org.gnome.desktop.screensaver lock-delay 600

#Setting the compose key
sudo su
echo "XKBOPTIONS=compose:ralt" >> /etc/default/keyboard
exit
setxkbmap -option compose:ralt

echo "Desktop config done."

todo="$todo>>>>You need to logout then log back in for the compose key to take effect.\n"
