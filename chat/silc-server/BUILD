(
 if [ "$IPV6" == "y" ]
      then OPTS="$OPTS --enable-ipv6"
 fi
 
 ./configure  --prefix=/usr               \
               --sysconfdir=/etc/silc      \
               --localstatedir=/var/run    \
	       --with-logsdir=/var/log	   \
	       --with-simdir=/usr/lib/silc-server \
	       --with-docdir=/usr/doc/silc-server/doc \
	       --with-helpdir=/usr/share/silc/help \
	       $OPTS		      &&	
  make                                &&
  prepare_install                     &&
  make    install

) > $C_FIFO 2>&1

(

  case  $SILCD_BOOT  in
    y|Y|j|J)  cp  $SCRIPT_DIRECTORY/silcd.sh  /etc/init.d

              ln  -sf  ../init.d/silcd.sh  /etc/rc0.d/K50silcd
              ln  -sf  ../init.d/silcd.sh  /etc/rc6.d/K50silcd

              ln  -sf  ../init.d/silcd.sh  /etc/rc1.d/S90silcd
              ln  -sf  ../init.d/silcd.sh  /etc/rc2.d/S90silcd
              ln  -sf  ../init.d/silcd.sh  /etc/rc3.d/S90silcd
              ln  -sf  ../init.d/silcd.sh  /etc/rc4.d/S90silcd
              ln  -sf  ../init.d/silcd.sh  /etc/rc5.d/S90silcd
              ;;
          *)  ;;
  esac

)
