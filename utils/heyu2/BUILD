(
#zzzcrash&&
  sedit 's|/usr/local|/usr|;s/-O/$CFLAGS/' Configure &&
#  sedit 's|^[[:space:]]*\./install.sh$||' Configure &&

  ./Configure  					&&
  make         					&&
  prepare_install				&&
  if [ ! -x /etc/heyu/x10.conf ]; then
    mkdir -p /etc/heyu				&&
    cp x10config.sample /etc/heyu/x10.conf
  fi						&&
#  sedit "s/^TTY/OPTION TTY/" /etc/x10.conf	&&
  make install

) > $C_FIFO 2>&1
