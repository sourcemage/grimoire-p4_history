(

  autoheader &&
  autoconf   &&

  ./configure                 \
    --build=$BUILD            \
    --prefix=/usr             \
    --sysconfdir=/etc/privoxy \
    --localstatedir=/var      \
    --with-user=nobody        \
    --with-group=nogroup      \
    $OPTS                     &&

  make            &&
  prepare_install &&
  make    install

) >$C_FIFO 2>&1
