if spell_ok firefox; then
   patch -p1 < $SCRIPT_DIRECTORY/configure-firefox.diff &&
   CFLAGS="$CFLAGS -I/usr/include/firefox"
else
   CFLAGS="$CFLAGS -I/usr/include/mozilla"
fi  &&

./configure --prefix=${INSTALL_ROOT}/usr  \
        --sysconfdir=${INSTALL_ROOT}/etc  \
     --localstatedir=${INSTALL_ROOT}/var  \
                     $OPTS                &&
make
