(

  add_paths  /opt/gcc2

  ./configure  --prefix=/opt/gcc2    \
               --enable-shared       \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
