#!/bin/bash


#create a  non root galaxy user
sudo /usr/sbin/useradd galaxy_test -m -d /usr/local/galaxy_test
#install mercurial
sudo apt-get install mercurial
#sudo su galaxy_test
cd  /usr/local/galaxy_test
#wget the zip

#install virtual env for python
wget https://raw.github.com/pypa/virtualenv/master/virtualenv.py
python ./virtualenv.py --no-site-packages galaxy_env
. ./galaxy_env/bin/activate
source galaxy_env/bin/activate


#Install database
sudo apt-get install postgresql
sudo service postgresql initdb
sudo chkconfig postgresql on
sudo service postgresql start

sudo apt-get install libpcre3 libpcre3-dev


sudo apt-get --assume-yes install openssl
sudo apt-get --assume-yes install libssl-dev
sudo apt-get --assume-yes install ncurses-devel
sudo apt-get --assume-yes install zlib-devel
sudo apt-get --assume-yes install zlib1g-dev libncurses5-dev
sudo apt-get --assume-yes  install libpcre3 libpcre3-dev
wget http://nginx.org/download/nginx-1.0.10.tar.gz
tar xvf nginx-1.0.10.tar.gz
wget http://www.grid.net.ru/nginx/download/nginx_upload_module-2.2.0.tar.gz
tar xvf nginx_upload_module-2.2.0.tar.gz
cd nginx-1.0.10
sudo ./configure --sbin-path=/usr/local/sbin --add-module=../nginx_upload_module-2.2.0
sudo make
sudo make install



#install galaxy

hg clone https://bitbucket.org/steder/galaxy-globus

TEMP=$HOME/galaxy-dist/database/tmp 
export TEMP


#install tool dependencies
wget https://github.com/pred914/GALAXY--GLOBUS/tarball/master
tar xvf master
cd pred914-GALAXY--GLOBUS-0777d5b
unzip bowtie.zip
cd bowtie-0.12.7
sudo cp * /usr/bin




cd ..

tar boost_1_48_0.tar.gz
cd boost_1_48_0
sudo sh bootstrap.sh

tar xvf samtools-0.1.16.tar.bz2
cd samtools-0.1.16
cp samtools /usr/bin
make
make install

cd ..
tar xvf tophat-1.4.0.Linux_x86_64.tar.gz
cd  tophat-1.4.0.Linux_x86_64
cp * /usr/bin








