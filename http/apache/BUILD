(

  ./configure  --prefix=/usr                     \
               --sysconfdir=/etc/httpd           \
               --localstatedir=/var              \
               --logfiledir=/var/log/httpd       \
               --proxycachedir=/var/cache/httpd  \
               --runtimedir=/var/run/httpd       \
               --enable-module=most              \
               --enable-shared=max               \
               --enable-module=auth_db           \
               --enable-module=mmap_static       \
               --disable-module=auth_dbm         \
               --with-layout=GNU                 &&
  make                                           &&
  prepare_install                                &&
  make    install

) > $C_FIFO 2>&1  &&

(

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
