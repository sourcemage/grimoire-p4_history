(
  patch -p1 <$SPELL_DIRECTORY/kdepim-3.2.0-HOT_FIX_FOR_KMAIL.patch && 
 ./configure  --prefix=${INSTALL_ROOT}/usr        \
               --sysconfdir=${INSTALL_ROOT}/etc    \
               --localstatedir=${INSTALL_ROOT}/var \
               --disable-debug      \
	       --enable-final       \
	       $OPTS                &&
  make                              &&
  prepare_install                   &&
  make    install

) > $C_FIFO 2>&1
