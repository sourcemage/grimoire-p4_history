(

  ./configure  --prefix=/usr           \
               --enable-multi-charset  \
               --with-theme-update     &&
  make                                 &&
  prepare_install                      &&
#  tic   doc/Eterm.ti                  &&
  make  install                        &&
  chmod  u+s  /usr/bin/Eterm

) > $C_FIFO 2>&1
