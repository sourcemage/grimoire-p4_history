(
  echo  "OPTS=$OPTS"
  ./configure  --prefix=/usr                                   		\
               --sysconfdir=/etc/httpd                         		\
               --localstatedir=/var                         \
               --enable-modules=most,max \
               --enable-info                     			\
               --enable-cgi                      			\
               --enable-layout=GNU               			\
               $OPTS                                     &&
  make                                           			&&
  prepare_install                                			&&
  make    install

) > $C_FIFO 2>&1  &&

(

  ln -s /usr/sbin/envvars /usr/bin/envvars
  ln -s /usr/sbin/httpd /usr/bin/httpd
  mkdir -p /var/run/httpd

  [ -x /etc/init.d/apache.sh ] || cp  $SCRIPT_DIRECTORY/apache.sh  /etc/init.d/

  case  $APACHE_BOOT  in
    y|Y|j|J)
      ln  -sf  ../init.d/apache.sh  /etc/rc0.d/K10apache
      ln  -sf  ../init.d/apache.sh  /etc/rc1.d/K10apache
      ln  -sf  ../init.d/apache.sh  /etc/rc2.d/K10apache
      ln  -sf  ../init.d/apache.sh  /etc/rc6.d/K10apache

      ln  -sf  ../init.d/apache.sh  /etc/rc3.d/S90apache
      ln  -sf  ../init.d/apache.sh  /etc/rc4.d/S90apache
      ln  -sf  ../init.d/apache.sh  /etc/rc5.d/S90apache
      ;;
          *)  true  ;;
  esac

)
