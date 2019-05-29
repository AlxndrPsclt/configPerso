echo "--------------------------------"
echo "Minimal installation starting..."

echo "Installing ssh"
sudo pacman -S openssh
sudo systemctl enable sshd
sudo systemctl start sshd

sudo pacman -S avahi
sudo systemctl enable avahi-daemon
sudo systemctl start avahi-daemon


#Git install
echo "Git config"
git config --global user.email "alxndr.psclt@gmail.com"
git config --global user.name "alxndrpsclt"

#Vim install
echo "Vim installation"
sudo pacman -S vim
rm -rf ~/.vim
git clone https://github.com/AlxndrPsclt/dotvim.git ~/.vim
rm ~/.vimrc
ln -s ~/.vim/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#TODO "$todo>>>>Upon first vim launch, run :PluginInstall\n"

#Powerline fonts installation
#git clone https://github.com/powerline/fonts.git /tmp/powerlinefonts --depth=1
#/tmp/powerlinefonts/install.sh
#rm -rf /tmp/powerlinefonts
sudo pacman -S powerline-fonts

#Git prompt install
yay -S aur/bash-git-prompt

echo "Some other nice software"
yay -S aur/byobu
sudo pacman -S nmap
#gem install tmuxinator #Gem is not installed yet!

sudo pacman -S htop
#sudo apt-get install --yes --force-yes ranger

sudo pacman -S community/the_silver_searcher

sudo pacman -S community/fzf


#echo "Installing sc-im, a terminal spreadsheet editor"
#source ~/.config/perso/environements/software/sc-im.sh

echo "Linking some private tool scripts"
sudo ln -s ~/.config/perso/tool/virtualpy /usr/local/bin/

echo "Done minimal environment setup."
echo "--------------------------------"
