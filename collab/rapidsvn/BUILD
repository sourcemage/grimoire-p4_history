# $Id: BUILD,v 1.1 2002/10/25 18:57:12 sergeyli Exp $
(

  message "${MESSAGE_COLOR}Downloading the up-to-date source...${DEFAULT_COLOR}"
#  svn export http://svn.collab.net/repos/svn/clients/rapidsvn/trunk . &&
#  autoconf &&
  ./configure \
    --build=$BUILD \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    $OPTS &&
  cd src &&
  sedit 's|^\(SVN_INC\)=.*$|\1=-I/usr/include/subversion-1|' Makefile &&
  make &&
  prepare_install &&
  cp -f rapidsvn /usr/bin

) > $C_FIFO 2>&1
