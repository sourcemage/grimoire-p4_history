(

  export    CFLAGS="${CFLAGS/-funroll-loops//} -O3"
  export  CXXFLAGS="${CXXFLAGS/-funroll-loops//} -O3"

  ./configure  --prefix=${INSTALL_ROOT}/usr  \
               --enable-shared               \
               $OPTS                         &&
  make                        &&
  prepare_install             &&
  make    install             &&
  
  if    [  !  -f               ${INSTALL_ROOT}/etc/ffserver.conf  ]
  then  cp  doc/ffserver.conf  ${INSTALL_ROOT}/etc/ffserver.conf
  fi

) > $C_FIFO 2>&1
