(

  if [ "$SASLAUTHD" == "y" ]; then
    OPTS="$OPTS --with-saslauthd=/var/state/saslauthd"
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
    mkdir -p --mode=700 /var/state/saslauthd
    cp $SCRIPT_DIRECTORY/saslauthd.sh /etc/init.d/

    ln  -nsf  ../init.d/saslauthd.sh  /etc/rc0.d/K45saslauthd
    ln  -nsf  ../init.d/saslauthd.sh  /etc/rc6.d/K45saslauthd

    ln  -nsf  ../init.d/saslauthd.sh  /etc/rc1.d/S40saslauthd
    ln  -nsf  ../init.d/saslauthd.sh  /etc/rc2.d/S40saslauthd
    ln  -nsf  ../init.d/saslauthd.sh  /etc/rc3.d/S40saslauthd
    ln  -nsf  ../init.d/saslauthd.sh  /etc/rc4.d/S40saslauthd
    ln  -nsf  ../init.d/saslauthd.sh  /etc/rc5.d/S40saslauthd
  elif [ "$SASLDB" == "y" ]; then
    mkdir -p --mode=700 /etc/sasldb
  fi

)
