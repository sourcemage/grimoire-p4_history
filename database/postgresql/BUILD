(

  ./configure  --build=$BUILD                          \
               --prefix=${INSTALL_ROOT}/usr            \
               --docdir=${INSTALL_ROOT}/usr/share/doc  \
               --mandir=${INSTALL_ROOT}/usr/share/man  \
               --sysconfdir=${INSTALL_ROOT}/etc        \
               --localstatedir=${INSTALL_ROOT}/var     \
               --enable-syslog          \
               --with-CXX               \
               $OPTS                    &&
  make                                  &&
  prepare_install                       &&
  make    install                       &&
  make    install-all-headers           &&
  cd      contrib/pgcrypto              &&
  make                                  &&
  make    install                       &&
  
 mkdir  -p  /var/lib/postgres/data	&& 
 touch      /var/log/postgres           &&
 chown  -R postgres.postgres  /var/lib/postgres  /var/log/postgres &&
 chmod -R 0700 /var/lib/postgres

) > $C_FIFO 2>&1 && (

  if echo "$OPTS" | grep -q "with-openssl" && ! [ -e /var/lib/postgres/data/server.crt ]; then
    message "${MESSAGE_COLOR}Please place server key and certificate files${DEFAULT_COLOR}"
    message "${MESSAGE_COLOR}server.key and server.crt into /var/lib/postgres/data.${DEFAULT_COLOR}"
    message "${MESSAGE_COLOR}See spell apache2, script mksscert.sh, for steps${DEFAULT_COLOR}"
    message "${MESSAGE_COLOR}to generate server certificate file.${DEFAULT_COLOR}"
    message "${MESSAGE_COLOR}You can use the CA key and certificate generated for${DEFAULT_COLOR}"
    message "${MESSAGE_COLOR}apache2, located in /etc/httpd/ssl/ca-{key,certificate}.pem,${DEFAULT_COLOR}"
    message "${MESSAGE_COLOR}to sign the certificate for PostgreSQL.${DEFAULT_COLOR}"
  fi
#    message "${PROBLEM_COLOR}PostgreSQL server will not start without a certificate!${DEFAULT_COLOR}"

)
