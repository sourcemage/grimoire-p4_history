(

  export    CFLAGS="$( echo  $CFLAGS    |  sed  s/-funroll-loops// )"
  export  CXXFLAGS="$( echo  $CXXFLAGS  |  sed  s/-funroll-loops// )"

  if    [  "$MMX"  ==  "n"  ]
  then  OPTS="$OPTS  --disable-mmx"
  fi

  ./configure  --prefix=/usr  \
               $OPTS          &&
  make                        &&
  prepare_install             &&
  make    install             &&
  
  if    [  !  -f               /etc/ffserver.conf  ]
  then  cp  doc/ffserver.conf  /etc/ffserver.conf
  fi

) > $C_FIFO 2>&1
