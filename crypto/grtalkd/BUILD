(

  make                            &&
  prepare_install                 &&
  cp  grtalkd  /usr/sbin          &&
  cp  grtalk   /usr/bin           &&
  chmod  755   /usr/sbin/grtalkd  &&
  chmod  755   /usr/bin/grtalk      

) > $C_FIFO 2>&1  && (

# since it cant be started via xinetd :(

  cp  $SCRIPT_DIRECTORY/grtalkd.sh  /etc/init.d

  if  [  "$GRTALKD_BOOT"  ==  "y"  ];  then
    ln  -sf     ../init.d/grtalkd.sh   /etc/rc3.d/S99grtalkd
    ln  -sf     ../init.d/grtalkd.sh   /etc/rc4.d/S99grtalkd
    ln  -sf     ../init.d/grtalkd.sh   /etc/rc5.d/S99grtalkd

    ln  -sf     ../init.d/grtalkd.sh   /etc/rc0.d/K01grtalkd
    ln  -sf     ../init.d/grtalkd.sh   /etc/rc6.d/K01grtalkd
  fi

)
