(

  CFLAGS=`echo $CFLAGS | sed "s/-funroll-loops//"` &&
  CXXFLAGS="$CFLAGS"                               &&
  export  CFLAGS                                   &&
  export  CXXFLAGS                                 &&
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1

