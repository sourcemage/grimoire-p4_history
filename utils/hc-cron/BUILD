(

  cp   compat.h  compat.h.old          &&
  sed  "s/SYS_TIME_H 1/SYS_TIME_H 0/"  \
       compat.h.old > compat.h         &&
  make                                 &&
  prepare_install                      &&
  make    install

) > $C_FIFO 2>&1
