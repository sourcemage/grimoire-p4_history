(

 ./configure  --build=$BUILD  --prefix=/usr $OPTS &&
  make  sysconfdir=/etc localstatedir=/var/cache  &&
  prepare_install                                 &&
  make  sysconfdir=/etc localstatedir=/var/cache libexecdir=/usr/bin install

) > $C_FIFO 2>&1
