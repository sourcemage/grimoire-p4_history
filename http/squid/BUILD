(

  sedit  "s:\$(localstatedir)/logs/squid\.pid:/var/run/squid\.pid:"  src/Makefile.in &&

# This must be set by CONFIGURE ideally
# See src/auth/ directory for a list of authentication protocols
  SQUID_AUTH=basic &&
# See helpers/*_auth/ directories for lists of authentication helpers
  SQUID_AUTH_BASIC=getpwnam,PAM &&
  SQUID_AUTH_DIGEST='' &&
  SQUID_AUTH_NTLM='' &&

  ./configure                                         \
    --prefix=/usr                                     \
    --sysconfdir=/etc/squid                           \
    --localstatedir=/var/cache/squid                  \
    --enable-async-io                                 \
    --enable-snmp                                     \
    --enable-removal-policies	                      \
    --enable-linux-netfilter                          \
    --enable-auth="$SQUID_AUTH"                       \
    --enable-basic-auth-helpers="$SQUID_AUTH_BASIC"   \
    --enable-digest-auth-helpers="$SQUID_AUTH_DIGEST" \
    --enable-ntlm-auth-helpers="$SQUID_AUTH_NTLM"     \
    $OPTS                                             &&

  make            &&
  prepare_install &&
  make    install &&

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
