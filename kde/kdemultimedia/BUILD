(

  # Fixes Bug #423 (compile with gcc3)
  patch  -p1  <  $SCRIPT_DIRECTORY/kdemultimedia.patch  &&

  ./configure  --prefix=/usr        \
               --sysconfdir=/etc    \
               --localstatedir=/var \
               --disable-debug      \
	       --enable-final       \
	       $OPTS                &&
  make                              &&
  prepare_install                   &&
  make    install

) > $C_FIFO 2>&1
