# these modules are not enabled by default and not part of any dependency
HTTPD_MODULES=$(cat $SCRIPT_DIRECTORY/enable-modules | while read m; do echo -n " --enable-$m=shared"; done) &&

./configure                            \
  --prefix=$INSTALL_ROOT/usr           \
  --sysconfdir=$INSTALL_ROOT/etc/httpd \
  --localstatedir=$INSTALL_ROOT/var    \
  --with-mpm=${HTTPD_MPM:=prefork}     \
  --enable-layout=GNU                  \
  --enable-so=static                   \
  $OPTS                                &&
make
