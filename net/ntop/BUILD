(

  OPTS="$OPTS --localstatedir=${INSTALL_ROOT}/var/cache"
  default_build  &&
  mkdir  -p  /var/cache/ntop  &&
  create_account  ntop  &&
  chown  -R  ntop.ntop  /var/cache/ntop

) > $C_FIFO 2>&1
