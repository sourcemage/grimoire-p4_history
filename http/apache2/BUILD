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


  case  $APACHE_BOOT  in
    y|Y|j|J)
           installscript apache.sh
	  ;;
          *)  true  ;;
  esac

)
