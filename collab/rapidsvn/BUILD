(

#  message "${MESSAGE_COLOR}Downloading the up-to-date source...${DEFAULT_COLOR}"
#  svn export http://svn.collab.net/repos/svn/clients/rapidsvn/trunk . &&

  ./configure \
    --build=$BUILD \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-svn-include=/usr/include \
    --with-svn-lib=/usr/lib \
    $OPTS &&
  make &&
  make check &&

  prepare_install &&
  make install

) >$C_FIFO 2>&1
