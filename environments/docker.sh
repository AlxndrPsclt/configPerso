sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
deb https://apt.dockerproject.org/repo ubuntu-xenial main


echo "$REPO" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update

sudo apt-get install docker.io

#Installing docker-compose
sudo su
curl -L https://github.com/docker/compose/releases/download/1.9.0-rc4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#Installing command completition
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

#Starts a docker ui container
docker run -d -p 9000:9000 --name ui4docker --privileged -v /var/run/docker.sock:/var/run/docker.sock uifd/ui-for-docker
#We should stop this container after it was created The user can start it with docker run 

sudo alex
