patch  -p0  <  $SCRIPT_DIRECTORY/apache_1.3.26_db4.patch

export  SSL_BASE=SYSTEM
export  EAPI_MM=SYSTEM


APACHE_CONFIGURE=\
"./configure  --prefix=/usr
              --sysconfdir=/etc/httpsd
              --localstatedir=/var/lib/httpsd
              --logfiledir=/var/log/httpsd
              --proxycachedir=/var/cache/httpsd
              --runtimedir=/var/run/httpsd
              --datadir=/usr/share/httpsd
              --enable-module=ssl
              --enable-module=most
              --enable-shared=max
              --enable-module=auth_db
              --enable-module=mmap_static
              --disable-module=auth_dbm
	      --enable-rule=EAPI
              --with-layout=GNU"


case  $CERTIFICATE  in

  y|Y|j|J)

    cd  mod_ssl-$VERSION                         &&
    ./configure  --with-apache=../apache_1.3.26  &&
    cd  ../apache_1.3.26                         &&
    $APACHE_CONFIGURE                            &&
    make  certificate  TYPE="custom"             &&
    echo  "CERTIFICATE=done"  >>  $SPELL_CONFIG  &&
    (  make             &&
       prepare_install  &&
       make    install
    ) > $C_FIFO 2>&1
  ;;

  *)

    (  cd  mod_ssl-$VERSION                         &&
       ./configure  --with-apache=../apache_1.3.26  &&
       cd  ../apache_1.3.26                         &&
       $APACHE_CONFIGURE                            &&
       make  certificate  TYPE="existing"           \
             CRT=/etc/httpsd/ssl.crt/server.crt     &&
       make                                         &&
       prepare_install                              &&
       make    install
    ) > $C_FIFO 2>&1
  ;;

esac  &&

(

  cp  $SCRIPT_DIRECTORY/apache_modssl.sh  /etc/init.d

  SOURCE="../init.d/apache_modssl.sh"
   START="S90apache_modssl"
    STOP="K10apache_modssl"

  case  $MODSSL_BOOT  in
    y|Y|j|J)  ln  -sf  $SOURCE  /etc/rc0.d/$STOP
              ln  -sf  $SOURCE  /etc/rc1.d/$STOP
              ln  -sf  $SOURCE  /etc/rc2.d/$STOP
              ln  -sf  $SOURCE  /etc/rc6.d/$STOP

              ln  -sf  $SOURCE  /etc/rc3.d/$START
              ln  -sf  $SOURCE  /etc/rc4.d/$START
              ln  -sf  $SOURCE  /etc/rc5.d/$START
              ;;
          *)  true  ;;
  esac

)
