(
  if httpd -v | grep -q "Apache/2\."; then
    message "${MESSAGE_COLOR}Configuring for Apache 2.x${DEFAULT_COLOR}" &&
    OPTS="$OPTS --with-apxs2" &&
    # fix the "missing APR include files" error
    CFLAGS="$CFLAGS -I/usr/include/apr"
  else
    message "${MESSAGE_COLOR}Configuring for Apache 1.x${DEFAULT_COLOR}" &&
    OPTS="$OPTS --with-apxs"
  fi &&

  ./configure                          \
    --prefix=${INSTALL_ROOT}/usr                      \
    --sysconfdir=${INSTALL_ROOT}/etc                  \
    --with-exec-dir=${INSTALL_ROOT}/usr/bin           \
    --with-config-file-path=${INSTALL_ROOT}/etc       \
    --enable-cli                       \
    --disable-static                   \
    --disable-debug                    \
    --disable-rpath                    \
    --enable-inline-optimization       \
    --enable-pic                       \
    --enable-bcmath                    \
    --enable-magic-quotes              \
    --enable-sysvsem                   \
    --enable-sysvshm                   \
    --enable-force-cgi-redirect        \
    --enable-ftp                       \
    --enable-wddx                      \
    --enable-filepro                   \
    --enable-dbase                     \
    --enable-sockets                   \
    --enable-calendar                  \
    --with-iconv                       \
    --with-xmlrpc                      \
    --with-versioning                  \
    --with-mod_charset                 \
    --with-pear                        \
    --with-layout=GNU                  \
    $OPTS                              &&
  make                                 &&

  # safety precaution against earlier PHP installations removing httpd.conf
  # we can remove this sedit after a couple of ISOs (today's 2003-11-05)
  if [ -f $INSTALL_LOGS/$SPELL-* ]
     then  sedit 's|.*/httpd\.conf.*||g' $INSTALL_LOGS/$SPELL-* 
  fi              &&
  prepare_install &&
  make    install &&
  if         ! [ -e ${INSTALL_ROOT}/etc/php.ini ]; then
    cp php.ini-dist ${INSTALL_ROOT}/etc/php.ini
  fi

) >$C_FIFO 2>&1
