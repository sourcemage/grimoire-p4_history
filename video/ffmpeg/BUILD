(

  export    CFLAGS="$( echo  $CFLAGS    |  sed  s/-funroll-loops// )"
  export  CXXFLAGS="$( echo  $CXXFLAGS  |  sed  s/-funroll-loops// )"

  export    CFLAGS="$CFLAGS -O3"
  export  CXXFLAGS="$CXXFLAGS -O3"

  ./configure  --prefix=/usr    \
               --enable-shared  \
               $OPTS          &&
  make                        &&
  prepare_install             &&
  make    install             &&
  
  if    [  !  -f               /etc/ffserver.conf  ]
  then  cp  doc/ffserver.conf  /etc/ffserver.conf
  fi

) > $C_FIFO 2>&1
