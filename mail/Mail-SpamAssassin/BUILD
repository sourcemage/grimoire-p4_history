(

  perl  Makefile.PL  				&&
  make               				&&
  prepare_install    				&&
  MAKE_NJOBS_OLD=$MAKE_NJOBS			&&
  MAKE_NJOBS=1					&&
  make    install		
  MAKE_NJOBS=$MAKE_NJOBS_OLD

) > $C_FIFO 2>&1 &&  (

  if [ "$SPAMD" == "y" ]; then

    cp $SCRIPT_DIRECTORY/spamd.sh  /etc/init.d    &&
    ln  -sf  ../init.d/spamd.sh     /etc/rc3.d/S90spamd
    ln  -sf  ../init.d/spamd.sh     /etc/rc4.d/S90spamd
    ln  -sf  ../init.d/spamd.sh     /etc/rc5.d/S90spamd

    ln  -sf  ../init.d/spamd.sh     /etc/rc0.d/K10spamd
    ln  -sf  ../init.d/spamd.sh     /etc/rc6.d/K10spamd

  else

    rm -f /etc/rc0.d/K10spamd /etc/rc6.d/K10spamd /etc/rc5.d/S90spamd /etc/rc4.d/S90spamd /etc/rc3.d/S90spamd

  fi

)
