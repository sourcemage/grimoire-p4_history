(

  ./configure                  \
    --build=$BUILD             \
    --prefix=/usr              \
    --sysconfdir=/etc          \
    --localstatedir=/var/cache \
    --libexecdir=/usr/bin      \
    $OPTS                      &&
  make                         &&
  prepare_install              &&
  make    install              &&

) > $C_FIFO 2>&1
