(

  patch include/sundries.h < $SCRIPT_DIRECTORY/sundries.h.diff	&&

  default_build							&&

  mkdir -p      /usr/doc/$SPELL					&&
  cp examples/* /usr/doc/$SPELL					&&

  case  $WD_BOOT  in
    y|Y|j|J)  cp -v $SCRIPT_DIRECTORY/watchdog.sh  /etc/init.d/      &&

              ln  -sf  ../init.d/watchdog.sh  /etc/rc0.d/K90watchdog &&
              ln  -sf  ../init.d/watchdog.sh  /etc/rc1.d/K90watchdog &&
              ln  -sf  ../init.d/watchdog.sh  /etc/rc2.d/K90watchdog &&
              ln  -sf  ../init.d/watchdog.sh  /etc/rc6.d/K90watchdog &&

              ln  -sf  ../init.d/watchdog.sh  /etc/rc3.d/S10watchdog &&
              ln  -sf  ../init.d/watchdog.sh  /etc/rc4.d/S10watchdog &&
              ln  -sf  ../init.d/watchdog.sh  /etc/rc5.d/S10watchdog
              ;;
          *)  true  ;;
   esac   

) > $C_FIFO 2>&1  
