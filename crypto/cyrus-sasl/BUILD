if [ "$SASLAUTHD" == "y" ]; then
  OPTS="$OPTS --with-saslauthd=/var/run/saslauthd"
elif [ "$SASLDB" == "y" ]; then
  OPTS="$OPTS --with-dbpath=/etc/sasldb"
fi &&

./configure            \
  --build=$BUILD       \
  --prefix=$INSTALL_ROOT/usr        \
  --sysconfdir=$INSTALL_ROOT/etc    \
  --localstatedir=$INSTALL_ROOT/var \
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
fi
