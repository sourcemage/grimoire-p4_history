(

  message "${MESSAGE_COLOR}Downloading recent source...${DEFAULT_COLOR}" &&
  svn export --force http://svn.collab.net/repos/rapidsvn/trunk/ . &&

  if ! [ -x ./configure ]; then
    ./autogen.sh | true
  fi &&
  ./configure \
    --build=$BUILD \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    $OPTS &&
  make &&
  make check &&

  prepare_install &&
  make install

) >$C_FIFO 2>&1
