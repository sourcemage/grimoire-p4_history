(

  ./configure  --prefix=/usr            \
             --without-mozjs            \
      --disable-script-node-javascript  \
               $OPTS                    &&
  make                                  &&
  prepare_install                       &&
  make    install

) > $C_FIFO 2>&1
