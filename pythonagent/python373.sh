#!/bin/bash

echo '[*] Installing Python 3.7.3';

source $HELPER_SCRIPTS/document.sh

PYTHON373FOLDER=$AGENT_TOOLSDIRECTORY/Python/3.7.3/x64

yum install -y \
libffi libffi-devel \
    wget

cd /tmp/
wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz
tar -xf Python-3.7.3.tar.xz
cd Python-3.7.3
./configure --prefix=$PYTHON373FOLDER

make -j`nproc`
make altinstall
touch $AGENT_TOOLSDIRECTORY/Python/3.7.3/x64.complete

cd ..

rm Python-3.7.3.tar.xz
rm -rf Python-3.7.3

# create symlinks
cd $AGENT_TOOLSDIRECTORY/Python/3.7.3/x64/bin
ln -s python3.7 python
ln -s pip3.7 pip
ln -s pyvenv-3.7 pyenv
cd /azp/
