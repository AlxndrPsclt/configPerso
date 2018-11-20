#Virtualenwraooer intall and other python tools
echo "Python tools installation"
echo "Installing pip, and virtualenvwrapper"

sudo apt-get update

echo "Installing docker and docker-compose"
sudo apt-get install python-pip

sudo pip install virtualenv
sudo pip install virtualenvwrapper
sudo apt install python3-distutils


echo "Installing docker and docker-compose"
sudo apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"

sudo apt-get update

sudo apt-get install -y docker-ce

sudo usermod -aG docker `whoami`
