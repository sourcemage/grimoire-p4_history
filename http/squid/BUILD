(

  sedit  "s:\$(localstatedir)/logs/squid\.pid:/var/run/squid\.pid:"  src/Makefile.in

  ./configure  --prefix=/usr                     \
               --sysconfdir=/etc/squid           \
               --localstatedir=/var/cache/squid  \
               --enable-async-io                 \
               --enable-snmp                     \
 	       --enable-removal-policies	 \
               --enable-linux-netfilter          \
               $OPTS                             &&
  make                                           &&
  prepare_install                                &&
  make    install                                &&

  cp  $SCRIPT_DIRECTORY/squid.sh  /etc/init.d/   &&
  if ! [ -x /var/log/squid ]; then
    mkdir  -p  /var/log/squid                    &&
    touch      /var/log/squid/access.log         &&
    touch      /var/log/squid/cache.log          &&
    touch      /var/log/squid/store.log
  fi

) > $C_FIFO 2>&1 && (

  case  $SQUID_BOOT  in
    y|Y|j|J)  ln  -sf  ../init.d/squid.sh  /etc/rc0.d/K25squid
              ln  -sf  ../init.d/squid.sh  /etc/rc1.d/K25squid
              ln  -sf  ../init.d/squid.sh  /etc/rc2.d/K25squid
              ln  -sf  ../init.d/squid.sh  /etc/rc6.d/K25squid

              ln  -sf  ../init.d/squid.sh  /etc/rc3.d/S90squid
              ln  -sf  ../init.d/squid.sh  /etc/rc4.d/S90squid
              ln  -sf  ../init.d/squid.sh  /etc/rc5.d/S90squid
              ;;
          *)  true
              ;;
  esac

  chown  -R  nobody.nogroup  /var/cache/squid

)
