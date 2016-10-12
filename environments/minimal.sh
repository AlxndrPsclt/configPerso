echo "--------------------------------"
echo "Minimal installation starting..."

#Git install
echo "Git config"
git config --global user.name alxndrpsclt

#Vim install
echo "Vim installation"
sudo apt-get install vim-nox
rm -rf ~/.vim
git clone https://github.com/AlxndrPsclt/dotvim.git ~/.vim
rm ~/.vimrc
ln -s ~/.vim/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
todo="$todo>>>>Upon first vim launch, run :PluginInstall\n"


echo "Some other nice software"
sudo apt-get install byobu
#gem install tmuxinator #Gem is not installed yet!

sudo apt-get install htop

sudo apt-get install silversearcher-ag

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Done minimal environment setup."
echo "--------------------------------"
