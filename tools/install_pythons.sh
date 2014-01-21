#!/usr/bin/env bash
# Installs Python 2.7.6 and 3.3.3 to /usr/local
# Creates /usr/local/bin/{python2.7,python3.3}

cd /tmp

# Compile tools
yum groupinstall "Development Tools"
yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel

# Python 2.7.6
wget http://www.python.org/ftp/python/2.7.6/Python-2.7.6.tar.xz
tar xf Python-2.7.6.tar.xz
cd Python-2.7.6
./configure --prefix=/usr/local
make && make altinstall
cd ..

# Python 3.3.3
wget http://www.python.org/ftp/python/3.3.3/Python-3.3.3.tar.xz
tar xf Python-3.3.3.tar.xz
cd Python-3.3.3
./configure --prefix=/usr/local
make && make altinstall
cd ..

# Setuptools
wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
/usr/local/bin/python2.7 ez_setup.py
/usr/local/bin/python3.3 ez_setup.py

# pip
wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
/usr/local/bin/python2.7 get-pip.py
/usr/local/bin/python3.3 get-pip.py

# virtualenv
/usr/local/bin/pip install virtualenv
