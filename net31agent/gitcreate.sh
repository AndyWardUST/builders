#!/bin/bash
 
#Based on https://gist.github.com/matthewriley/b74fa53594db1354e5593994c5d5b5a4 
 
mkdir tempgit
cd tempgit
yum install -y autoconf cpio curl-devel expat-devel gcc gettext-devel make openssl-devel perl-ExtUtils-MakeMaker wget zlib-devel
wget -O v2.26.2.tar.gz https://github.com/git/git/archive/v2.26.2.tar.gz
tar -xzvf ./v2.26.2.tar.gz
cd git-2.26.2/

echo Building Git v2.26.2 
make configure
./configure --prefix=/usr/local/git
make && make install
ln -sf /usr/local/git/bin/* /usr/bin/
 
cd ..
rm -fr git-2.26.2
cd ..
rm -fr tempgit
 
echo "results"
which git
git --version
