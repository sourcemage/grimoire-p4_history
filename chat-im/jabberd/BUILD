(

# create_account jabberd &&

  for f in $(find . -name "*" -type f); do
    sedit 's|/jabberd/log|/log/jabberd|' $f
  done &&

  if echo "$OPTS" | grep -q 'with-berkeley-db'; then STORAGE="$STORAGE db" && AUTHREG="$AUTHREG db"; fi &&
  if echo "$OPTS" | grep -q 'with-mysql'; then STORAGE="$STORAGE mysql" && AUTHREG="$AUTHREG mysql"; fi &&
  if echo "$OPTS" | grep -q 'with-pgsql'; then STORAGE="$STORAGE pgsql" && AUTHREG="$AUTHREG pgsql"; fi &&

  if echo "$OPTS" | grep -q 'with-openldap'; then AUTHREG="$AUTHREG ldap"; fi &&
  if echo "$OPTS" | grep -q 'with-pam'; then AUTHREG="$AUTHREG pam"; fi &&

  message "Storage drivers:$STORAGE" &&
  message "Authentication modules:$AUTHREG" &&

  ./configure \
    --build=$BUILD \
    --prefix=$INSTALL_ROOT/usr \
    --sysconfdir=$INSTALL_ROOT/etc \
    --localstatedir=$INSTALL_ROOT/var \
    --enable-storage="$STORAGE" \
    --enable-authreg="$AUTHREG" \
    --enable-debug \
    --with-libiconv-prefix=${INSTALL_ROOT}/usr \
    $OPTS &&
  make &&
  prepare_install &&
  make    install

) >$C_FIFO 2>&1 && (

  mkdir -p --mode=700 ${INSTALL_ROOT}/var/jabberd/db
  mkdir -p --mode=700 ${INSTALL_ROOT}/var/log/jabberd
# chown -R jabberd:jabberd /var/jabberd /var/log/jabberd

)
