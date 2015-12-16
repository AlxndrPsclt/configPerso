#Adding repositories

#Bash config things
mkdir -p ~/.config/perso/

ln -s ~/.config/perso/bash_config/.bashrc ~/.bashrc
ln -s ~/.config/perso/bash_config/.bash_aliases ~/.bash_aliases
ln -s ~/.config/perso/bash_config/.bash_profile ~/.bash_profile

sudo apt-get update

#Git install
sudo apt-get install git
git config --global user.name alxndrpsclt

#Vim install
echo "Vim installation"
sudo apt-get install vim-nox
git clone https://github.com/AlxndrPsclt/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Upon first vim launch, run :PluginInstall"




echo "Some other nice software"

sudo apt-get install tmux

sudo add-apt-repository ppa:fossfreedom/packagefixes
sudo apt-get install banish404
