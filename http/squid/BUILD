(

  unpack $SOURCE_CACHE/$SOURCE2 ${MD5[1]} && patch helpers/ntlm_auth/SMB/libntlmssp.c < $SOURCE_CACHE/$SOURCE2

  sedit  "s:\$(localstatedir)/logs/squid\.pid:/var/run/squid\.pid:"  src/Makefile.in &&

# This must be set by CONFIGURE ideally
# See src/auth/ directory for a list of authentication protocols
  SQUID_AUTH=basic &&
# See helpers/*_auth/ directories for lists of authentication helpers
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
    --enable-digest-auth-helpers="$SQUID_AUTH_DIGEST" \
    --enable-ntlm-auth-helpers="$SQUID_AUTH_NTLM"     \
    $OPTS                                             &&

  make            &&
  prepare_install &&
  make    install &&

  chown  -R  nobody.nogroup  /var/cache/squid    &&

  if ! [ -x /var/log/squid ]; then
    mkdir  -p  /var/log/squid                    &&
    touch      /var/log/squid/access.log         &&
    touch      /var/log/squid/cache.log          &&
    touch      /var/log/squid/store.log
  fi

) >$C_FIFO 2>&1
