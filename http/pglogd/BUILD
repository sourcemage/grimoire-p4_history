(
  sedit  "s/\/usr\/local\/pgsql/\/usr/"  Makefile  &&
  make                               &&
  prepare_install                    
  
) > $C_FIFO 2>&1  &&

(                       

  cp pglogd /usr/sbin 
  
  sedit "s/\/var\/log\/pglogd.log/\/var\/log\/pglogd\/pglogd.log/" pglogd.conf
  sedit "s/\/usr\/site\/logs\/pglogd_overflow/\/var\/log\/pglogd\/pglogd_overflow/" pglogd.conf
  [  -e  /etc/pglogd.conf      ]  ||   cp pglogd.conf /etc/pglogd.conf
  chmod o-rwx /etc/pglogd.conf

  cp  $SCRIPT_DIRECTORY/pglogd.sh  /etc/init.d
  mkdir -p /usr/doc/pglogd/
  cp  *.sql /usr/doc/pglogd/
  cp  queries.txt /usr/doc/pglogd
  cp  $SCRIPT_DIRECTORY/pglogd.quick /usr/doc/pglogd

  case  $PGLOGD_BOOT  in
    y|Y|j|J)
      ln  -sf  ../init.d/pglogd.sh  /etc/rc0.d/K11pglogd
      ln  -sf  ../init.d/pglogd.sh  /etc/rc1.d/K11pglogd
      ln  -sf  ../init.d/pglogd.sh  /etc/rc2.d/K11pglogd
      ln  -sf  ../init.d/pglogd.sh  /etc/rc6.d/K11pglogd

      ln  -sf  ../init.d/pglogd.sh  /etc/rc3.d/S33pglogd
      ln  -sf  ../init.d/pglogd.sh  /etc/rc4.d/S33pglogd
      ln  -sf  ../init.d/pglogd.sh  /etc/rc5.d/S33pglogd
      ;;
          *)  true  ;;
  esac

)
