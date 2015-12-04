#Adding repositories

#Bash config things
#mkdir -p ~/.config/

ln -s ~/.config/perso/bash_config/.bashrc ~/.bashrc
ln -s ~/.config/perso/bash_config/.bash_aliases ~/.bash_aliases
ln -s ~/.config/perso/bash_config/.bash_profile ~/.bash_profile

sudo apt-get update

#Vim installation
sudo apt-get install vim-nox
git clone https://github.com/AlxndrPsclt/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


sudo apt-get install tmux

sudo add-apt-repository ppa:fossfreedom/packagefixes
sudo apt-get install banish404

!!
