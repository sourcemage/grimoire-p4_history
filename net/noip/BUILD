(

  patch Makefile <$SCRIPT_DIRECTORY/Makefile.diff		&&
  patch noip2.c  <$SCRIPT_DIRECTORY/noip2.c.diff		&&

  make             						&&

  prepare_install  						&&

  case  $NOIP_BOOT in
     y|Y) message "${MESSAGE_COLOR}Setting up /etc/init.d/noip.sh ${DEFAULT_COLOR}" &&
          cp $SCRIPT_DIRECTORY/noip.sh     /etc/init.d          &&
          ln     -sf  /etc/init.d/noip.sh  /etc/rc0.d/K70noip   &&
          ln     -sf  /etc/init.d/noip.sh  /etc/rc1.d/K70noip   &&
          ln     -sf  /etc/init.d/noip.sh  /etc/rc2.d/K70noip   &&
          ln     -sf  /etc/init.d/noip.sh  /etc/rc6.d/K70noip   &&

          ln     -sf  /etc/init.d/noip.sh  /etc/rc3.d/S40noip   &&
          ln     -sf  /etc/init.d/noip.sh  /etc/rc4.d/S40noip   &&
          ln     -sf  /etc/init.d/noip.sh  /etc/rc5.d/S40noip   ;;
     *)   true ;;
  esac                                                          &&


  mkdir -p             /usr/doc/noip				&&
  cp COPYING           /usr/doc/noip				&&
  cp README.FIRST      /usr/doc/noip  				&&
  chown root.root      noip2					&&
  chmod 500            noip2					&&
  cp noip2	       /usr/bin

) > $C_FIFO 2>&1
