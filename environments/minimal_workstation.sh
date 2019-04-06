#!/bin/bash

# Taskwarrior install

old_dir=$(pwd)
cd /tmp
git clone --recursive -b 2.6.0 https://github.com/GothenburgBitFactory/taskwarrior.git
cd taskwarrior

sudo apt install libgnutls28-dev                                                                                                           
sudo apt install uuid-dev  

cmake -DCMAKE_BUILD_TYPE=release .
make
sudo make install

echo "Taskwarior installed"


# TODO: Add uberzug install
