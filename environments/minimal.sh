echo "--------------------------------"
echo "Minimal installation starting..."

#Git install
echo "Git config"
git config --global user.email "alxndr.psclt@gmail.com"
git config --global user.name "alxndrpsclt"

#Vim install
echo "Vim installation"
sudo apt-get install --yes --force-yes vim-nox
rm -rf ~/.vim
git clone https://github.com/AlxndrPsclt/dotvim.git ~/.vim
rm ~/.vimrc
ln -s ~/.vim/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
todo="$todo>>>>Upon first vim launch, run :PluginInstall\n"

#Powerline fonts installation
git clone https://github.com/powerline/fonts.git /tmp/powerlinefonts
/tmp/powerlinefonts/install.sh


echo "Some other nice software"
sudo apt-get install --yes --force-yes byobu
sudo apt-get install --yes --force-yes nmap
#gem install tmuxinator #Gem is not installed yet!

sudo apt-get install --yes --force-yes htop

sudo apt-get install --yes --force-yes silversearcher-ag

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Installing ssh"
sudo apt-get install --yes --force-yes openssh-client
sudo apt-get install --yes --force-yes openssh-server

echo "Installing bannish404"
sudo apt-get install --yes --force-yes gksu
cd /tmp/
wget https://launchpad.net/~fossfreedom/+archive/packagefixes/+files/banish404_0.1-4_all.deb
sudo dpkg -i banish404_0.1-4_all.deb
rm -f banish404_0.1-4_all.deb


echo "Done minimal environment setup."
echo "--------------------------------"
