(

#  if  spell_installed  ppp;  then
#    sedit  "s:/etc/resolv.conf:/etc/ppp/resolv.conf:"  \
#           src/dns_internal.c
#  fi

 sedit  "s:\$(localstatedir)/logs/squid\.pid:/var/run/squid\.pid:"  \
         src/Makefile.in

  ./configure  --prefix=/usr                     \
               --sysconfdir=/etc/squid           \
               --localstatedir=/var/cache/squid  \
               --enable-async-io                 \
               --enable-snmp                     \
               --enable-linux-netfilter          \
               $OPTS                             &&
  make                                           &&
  prepare_install                                &&
  make    install                                &&

  cp  $SCRIPT_DIRECTORY/squid.sh  /etc/init.d    &&

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

) > $C_FIFO 2>&1
