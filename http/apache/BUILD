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

  case  $APACHE_BOOT  in
    y|Y|j|J)
            installscript apache.sh
      ;;
          *)  true  ;;
  esac

)
