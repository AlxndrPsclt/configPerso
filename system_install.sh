#!/bin/bash
# This script does its best to reinstall the commonly used software on my machine!

#Adding repositories
sh ./repositories.sh


#Bash config things
mkdir -p ~/.config/perso/

ln -s ~/.config/perso/bash_config/.bashrc ~/.bashrc
ln -s ~/.config/perso/bash_config/.bash_aliases ~/.bash_aliases
ln -s ~/.config/perso/bash_config/.bash_profile ~/.bash_profile
ln -s ~/.config/perso/bash_config/.bash_funcs ~/.bash_funcs
ln -s ~/.config/perso/bash_config/.bash_completition ~/.bash_completition

sudo apt-get update

#Git install
echo "Git installation"
sudo apt-get install git
git config --global user.name alxndrpsclt

#Vim install
echo "Vim installation"
sudo apt-get install vim-nox
rm -rf ~/.vim
git clone https://github.com/AlxndrPsclt/dotvim.git ~/.vim
rm ~/.vimrc
ln -s ~/.vim/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo ">>>>Upon first vim launch, run :PluginInstall"

#Ruby, RVM install
echo "RVM installation"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby



echo "Some other nice software"

sudo apt-get install tmux
sudo apt-get install byobu
gem install tmuxinator
export EDITOR='vim'

sudo apt-get install htop

sudo apt-get install banish404

sudo apt-get install silversearcher-ag

sudo apt-get install xclip

sudo apt-get install libav-tools

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo apt-get install vlc
