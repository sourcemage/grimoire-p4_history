(

  export    CFLAGS="${CFLAGS/-funroll-loops//} -O3"
  export  CXXFLAGS="${CXXFLAGS/-funroll-loops//} -O3"

  ./configure  --prefix=/usr    \
               --enable-shared  \
               $OPTS          &&
  make                        &&
  prepare_install             &&
  make    install             &&
  (
    mkdir  -p  /usr/include/ffmpeg/libpostproc
    install  -m  644  libavcodec/libpostproc/postprocess*.h  \
                      /usr/include/ffmpeg/libpostproc
  )
  
  if    [  !  -f               /etc/ffserver.conf  ]
  then  cp  doc/ffserver.conf  /etc/ffserver.conf
  fi

) > $C_FIFO 2>&1
