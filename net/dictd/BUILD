(

  ./configure        &&
  make               &&
  prepare_install    &&
  make  install

) > $C_FIFO 2>&1  && (

  if  [  "$DICTD_BOOT"  ==  "y"  ];  then

    cp  $SCRIPT_DIRECTORY/dictd.sh  /etc/init.d

#    ln  -sf  ../init.d/dictd.sh  /etc/rc0.d/K10dictd
#    ln  -sf  ../init.d/dictd.sh  /etc/rc1.d/K10dictd
#    ln  -sf  ../init.d/dictd.sh  /etc/rc2.d/K10dictd
#    ln  -sf  ../init.d/dictd.sh  /etc/rc6.d/K10dictd

#    ln  -sf  ../init.d/dictd.sh  /etc/rc3.d/S90dictd
#    ln  -sf  ../init.d/dictd.sh  /etc/rc4.d/S90dictd
#    ln  -sf  ../init.d/dictd.sh  /etc/rc5.d/S90dictd

  fi

)
