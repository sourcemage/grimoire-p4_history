(

  ./configure                                     \
    --prefix=${INSTALL_ROOT}                      \
    --runas_usr=nobody                            \
    --runas_grp=nogroup                           \
    --sysconfdir=${INSTALL_ROOT}/etc/dansguardian \
    --sysvdir=${INSTALL_ROOT}/etc/init.d          \
    $OPTS                                         &&
  make            &&
  make    install

) >$C_FIFO 2>&1
