(

  cp   compat.h  compat.h.old          &&
  sed  "s/SYS_TIME_H 1/SYS_TIME_H 0/"  \
       compat.h.old > compat.h         &&
  make                                 &&
  prepare_install                      &&
  make    install

) > $C_FIFO 2>&1  &&  (


  cp  $SCRIPT_DIRECTORY/crond.sh  /etc/init.d
  ln     -sf  ../init.d/crond.sh  /etc/rcS.d/S80crond
  ln     -sf  ../init.d/crond.sh  /etc/rc0.d/K20crond
  ln     -sf  ../init.d/crond.sh  /etc/rc6.d/K20crond

)
