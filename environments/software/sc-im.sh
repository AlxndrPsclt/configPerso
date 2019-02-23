#Installing sc-im, a terminal spreadsheet editor
PREVIOUS_PATH=`pwd`
cd /tmp
git clone https://github.com/jmcnamara/libxlsxwriter.git
cd libxlsxwriter/
make
sudo make install
sudo ldconfig
cd ..
rm -rf /tmp/libxlsxwriter

git clone https://github.com/andmarti1424/sc-im.git
cd sc-im/src
make
sudo make install
cd ../../

rm -rf /tmp/sc-im

cd $PREVIOUS_PATH

