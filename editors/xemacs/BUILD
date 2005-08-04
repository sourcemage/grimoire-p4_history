OPTS="$OPTS --with-msw=no --with-file-coding=yes" &&

# copy real_default_build but don't use '--sysconfdir' or '--localstatedir' or '--build'
#OPTS="$OPTS --build=${BUILD}" &&
if [[ "$CROSS_INSTALL" == on ]]; then OPTS="$OPTS --host=${HOST}"; fi &&
./configure \
  --prefix=$INSTALL_ROOT/usr  \
  --mandir=$INSTALL_ROOT/usr/share/man   \
  --infodir=$INSTALL_ROOT/usr/share/info  \
  $OPTS &&
make
