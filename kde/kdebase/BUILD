(

  if  [  "$SHUTDOWN"  ==  "y"  ];  then
    patch  -p1  <  $SCRIPT_DIRECTORY/kdebase-2.2.2-shutdown.patch
  fi

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
