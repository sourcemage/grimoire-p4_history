(

  if  !  [  -e  /usr/bin/g77  ];  then
    OPTS="$OPTS  --without-fc"
  fi

  ./configure  --prefix=/usr          \
               --sysconfdir=/etc/lam  \
               $OPTS                  &&

  prepare_install                     &&
  make                                &&
  make    install
 
) > $C_FIFO 2>&1
