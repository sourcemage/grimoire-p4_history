{
  cp $SCRIPT_DIRECTORY/noip.sh /etc/init.d

  patch Makefile <$SCRIPT_DIRECTORY/Makefile.diff
  patch no-ip.sh <$SCRIPT_DIRECTORY/no-ip.sh.diff

  case  $NOIP_BOOT in
     y|Y)   ln     -sf  ../init.d/noip.sh  /etc/rc0.d/K70noip
            ln     -sf  ../init.d/noip.sh  /etc/rc1.d/K70noip
            ln     -sf  ../init.d/noip.sh  /etc/rc2.d/K70noip
            ln     -sf  ../init.d/noip.sh  /etc/rc6.d/K70noip

            ln     -sf  ../init.d/noip.sh  /etc/rc3.d/S40noip
            ln     -sf  ../init.d/noip.sh  /etc/rc4.d/S40noip
            ln     -sf  ../init.d/noip.sh  /etc/rc5.d/S40noip ;;
     *)     true ;;
  esac  

  make             &&
  prepare_install  &&

  mkdir                /usr/doc/noip
  mv COPYING           /usr/doc/noip
  mv README.FIRST      /usr/doc/noip  
  mv no-ip.conf.sample /usr/doc/noip
  chown root.root      no-ip.sh
  chmod 500            no-ip.sh
  mv no-ip.sh	       /usr/sbin/noip-configure.sh
  mv noip	       /usr/bin/noip

} > $C_FIFO 2>&1
