(

# create_account jabberd &&

# patch -p1 < $SCRIPT_DIRECTORY/authreg_ldap.patch &&

  for f in $(ls -1 etc/*); do
    sedit 's|/jabberd/log|/log/jabberd|' $f
  done &&

  ./configure \
    --build=$BUILD \
    --prefix=$INSTALL_ROOT/usr \
    --sysconfdir=$INSTALL_ROOT/etc \
    --localstatedir=$INSTALL_ROOT/var \
    --enable-debug \
    $OPTS &&
  make &&
  prepare_install &&
  make    install

) >$C_FIFO 2>&1 && (

  mkdir -p --mode=700 /var/jabberd/db
  mkdir -p --mode=700 /var/log/jabberd
# chown -R jabberd:jabberd /var/jabberd /var/log/jabberd

)
