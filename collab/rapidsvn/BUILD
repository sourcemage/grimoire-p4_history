(

#  message "${MESSAGE_COLOR}Downloading the up-to-date source...${DEFAULT_COLOR}"
#  svn export http://svn.collab.net/repos/svn/clients/rapidsvn/trunk . &&

  ./autogen.sh &&
  ./configure \
    --build=$BUILD \
    --prefix=$INSTALL_ROOT/usr \
    --sysconfdir=$INSTALL_ROOT/etc \
    --localstatedir=$INSTALL_ROOT/var \
    --with-apr-config=$(which apr-config) \
    --with-apu-config=$(which apu-config) \
    --with-svn-include=$INSTALL_ROOT/usr/include \
    --with-svn-lib=$INSTALL_ROOT/usr/lib \
    --with-wx-config=$(which wx-config) \
    $OPTS &&
  make &&
  make check &&

  prepare_install &&
  make install

) >$C_FIFO 2>&1
