(
  ./configure  --sysconfdir=${INSTALL_ROOT}/etc  \
               --prefix=${INSTALL_ROOT}/usr      \
               --with-largefile   \
               --with-everything  \
               $OPTS              &&
  make                            &&
  prepare_install                 &&
  make    install

) > $C_FIFO 2>&1  &&  (

  /bin/true
# this file ( pam/ftplockout ) doesn't exist, what should it be?
#  if    [  !  -f  /etc/ftplockout  ]
#  then  cp  pam/ftplockout  /etc
#  fi

)
