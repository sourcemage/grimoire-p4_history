(
  sedit 's|/man/|/share/man/|;s|/usr/local|${INSTALL_ROOT}/usr|;s/-O/$CFLAGS/' Configure &&

  ./Configure  					&&
  make         					&&
  prepare_install				&&
  if [ ! -x /etc/heyu/x10.conf ]; then
    mkdir -p /etc/heyu				&&
    cp x10config.sample /etc/heyu/x10.conf
  fi						&&
  make install

) > $C_FIFO 2>&1
