(

  if [ "$SASLAUTHD" == "y" ]; then
    OPTS="$OPTS --with-saslauthd=/var/run/saslauthd"
  elif [ "$SASLDB" == "y" ]; then
    OPTS="$OPTS --with-dbpath=/etc/sasldb"
  fi &&

  ./configure            \
    --build=$BUILD       \
    --prefix=/usr        \
    --sysconfdir=/etc    \
    --localstatedir=/var \
    --disable-krb4       \
    --disable-plain      \
    --disable-sample     \
    --enable-shared      \
    --with-gnu-ld        \
    $OPTS                &&
  make                   &&

  if [ "$SASLAUTHD" == "y" ]; then
    pushd saslauthd    &&
    make testsaslauthd &&
    popd
  fi &&

  prepare_install &&
  make install    &&

  if [ "$SASLAUTHD" == "y" ]; then
    cp saslauthd/testsaslauthd /usr/bin
  fi

) > $C_FIFO 2>&1 && (

  if [ "$SASLAUTHD" == "y" ]; then
    mkdir -p --mode=700 /var/run/saslauthd
  elif [ "$SASLDB" == "y" ]; then
    mkdir -p --mode=700 /etc/sasldb
  fi

)
