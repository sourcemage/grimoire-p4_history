(

  sedit  "s/\$localstatedir\/nessus\/CA/\/etc\/ssl\/nessus\/private/"  nessus-mkcert.in 
  sedit  "s/\$sharedstatedir\/nessus\/CA/\/etc\/ssl\/nessus\/certs/"   nessus-mkcert.in 

  default_build

) > $C_FIFO 2>&1

(

  cp  $SCRIPT_DIRECTORY/nessusd.sh  /etc/init.d

  if  [  "$NESSUSD_BOOT"  ==  "y"  ];  then

    ln  -sf  ../init.d/nessusd.sh  /etc/rc0.d/K10nessusd
    ln  -sf  ../init.d/nessusd.sh  /etc/rc1.d/K10nessusd
    ln  -sf  ../init.d/nessusd.sh  /etc/rc2.d/K10nessusd
    ln  -sf  ../init.d/nessusd.sh  /etc/rc6.d/K10nessusd

    ln  -sf  ../init.d/nessusd.sh  /etc/rc3.d/S90nessusd
    ln  -sf  ../init.d/nessusd.sh  /etc/rc4.d/S90nessusd
    ln  -sf  ../init.d/nessusd.sh  /etc/rc5.d/S90nessusd

  fi

)
