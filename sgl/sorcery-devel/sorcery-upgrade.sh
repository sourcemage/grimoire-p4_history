#!/bin/sh

cast lockexec
dispel sorcery sorcery-stable sorcery-devel
cd /tmp
wget http://download.sourcemage.org/sorcery/sorcery-stable.tar.bz2
tar --use=bzip2 -xvf sorcery-stable.tar.bz2
cd sorcery/
./install
sorcery update

