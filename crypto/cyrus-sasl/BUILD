if echo ${CS_MECH}|grep -q saslauthd; then
  OPTS="$OPTS --with-saslauthd=/var/run/saslauthd"
fi &&

if [ "$CS_DB" == "y" ] && [ "$CS_DB" == "y" ]; then
  OPTS="$OPTS --with-dblib=none --without-dblib" ;
fi &&

OPTS="$OPTS $CS_PLAIN $CS_LOGIN $CS_CRAM $CS_DIGEST $CS_OTP \
      $CS_SRP $CS_GSSAPI $CS_KRB4 $CS_DB $CS_GDBM $CS_SQL \
      $CS_SQLITE $CS_PSQL $CS_MYSQL $CS_ANON"

unset CFLAGS
unset LDFLAGS

./configure            \
  --build=$BUILD       \
  --prefix=$INSTALL_ROOT/usr        \
  --sysconfdir=$INSTALL_ROOT/etc    \
  --localstatedir=$INSTALL_ROOT/var \
  --disable-sample     \
  --with-gnu-ld        \
  $OPTS                &&
make                   &&

if echo ${CS_MECH}|grep -q saslauthd; then
  pushd saslauthd    &&
  make testsaslauthd &&
  popd
fi
