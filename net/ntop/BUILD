(

  OPTS="$OPTS --localstatedir=${INSTALL_ROOT}/var/cache"
  default_build  &&
  mkdir  -p  $INSTALL_ROOT/var/cache/ntop  &&
  create_account  ntop  &&
  chown  -R  ntop.ntop  $INSTALL_ROOT/var/cache/ntop

) > $C_FIFO 2>&1
