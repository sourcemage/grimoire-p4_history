(

  make                                                   &&
  prepare_install                                        &&
  cp chpax /usr/sbin                                     &&
  chmod 754 /usr/sbin/chpax                              &&
  cp $SOURCE_CACHE/chpax.sh /usr/sbin/chpax2.sh          &&
  tr -d '\r' < /usr/sbin/chpax2.sh > /usr/sbin/chpax.sh  &&
  chmod 754 /usr/sbin/chpax.sh                           &&
  {
    [ -e /etc/chpax.cfg ] ||
    cp $SOURCE_CACHE/chpax.cfg /etc
  }                                                      &&
  touch /etc/chpax.cfg


) > $C_FIFO 2>&1
