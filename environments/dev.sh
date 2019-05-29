echo "Python tools installation"
echo "Installing pip, and virtualenvwrapper"

echo "Installing docker and docker-compose"
sudo pacman -S python-pip

sudo pip install virtualenv
sudo pip install virtualenvwrapper
#sudo apt install python3-distutils


echo "Installing docker and docker-compose"
sudo pacman -S docker
#sudo systemctl enable docker.service
#sudo systemctl start docker.service
sudo usermod -aG docker `whoami`

sudo pacman -S docker-compose
