(

  ./configure            \
    --build=$BUILD       \
    --prefix=/usr        \
    --sysconfdir=/etc    \
    --localstatedir=/var \
    --enable-cleartext   \
    --enable-crypt       \
    --enable-rlookups    \
    $OPTS                &&

  make    depend  &&
  make            &&
  prepare_install &&
  make    install &&

  cp -f /usr/libexec/slapd /usr/sbin/ &&
  . $SCRIPT_DIRECTORY/mkconf.sh

) >$C_FIFO 2>&1
