(
  patch -p1 < $SPELL_DIRECTORY/SQLMoreResults.patch &&
  ./configure  --prefix=${INSTALL_ROOT}/usr        \
               --sysconfdir=${INSTALL_ROOT}/etc    \
               --localstatedir=${INSTALL_ROOT}/var \
               --disable-debug      \
               --enable-final       \
               $OPTS                &&
  make                              &&
  prepare_install                   &&
  make    install		    &&
# install some extra files
  cp include/{ini,log,lst}.h ${INSTALL_ROOT}/usr/include
) > $C_FIFO 2>&1
