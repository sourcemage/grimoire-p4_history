(

  sedit  "s/-O/$CFLAGS/"  Makefile.in


  # Looks like gdbm uses INSTALL_ROOT in its scripts, so we end up 
  # with a concatenation of INSTALL_ROOT, not very nice...
  ./configure  --prefix=/usr              \
               --infodir=/usr/share/info  \
               --mandir=/usr/share/man    \
               $OPTS                &&
  make                              &&
  prepare_install                   &&
  make  install         &&
  make  install-compat  &&
  # Preserve the links in chroot
  cd $INSTALL_ROOT/usr/lib &&
  ln    -sf  libgdbm.so.3.0.0     libndbm.so  &&
  ln    -sf  libgdbm.la  libndbm.la  &&
  ln    -sf  libgdbm.a   libndbm.a

) > $C_FIFO 2>&1
