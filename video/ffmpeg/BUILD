(

  export    CFLAGS="${CFLAGS/-funroll-loops/} -O3"
  export  CXXFLAGS="${CXXFLAGS/-funroll-loops/} -O3"

  patch  -p1  <  $SCRIPT_DIRECTORY/faad2.patch  &&
  sedit  's:-lpostproc:-Llibpostproc -lpostproc:'  libavcodec/Makefile  &&
  ./configure  --prefix=${INSTALL_ROOT}/usr  \
               --enable-shared               \
               --enable-pp                   \
               --enable-shared-pp            \
               --enable-a52                  \
               $OPTS                         &&
  cd  libavcodec/libpostproc  &&
  make                        &&
  cd  $SOURCE_DIRECTORY       &&
  make                        &&
  prepare_install             &&
  make    install             &&
  (
    cd  libavcodec/libpostproc  &&
    make  install               &&
    install  -m  644 postprocess_internal.h  \
                 ${INSTALL_ROOT}/usr/include/postproc
  )  &&
  (
    install  -m  644 libavcodec/bswap.h        \
                 ${INSTALL_ROOT}/usr/include/ffmpeg  &&
    install  -m  644 libavformat/os_support.h  \
                 ${INSTALL_ROOT}/usr/include/ffmpeg
  )  &&
  
  if    [  !  -f               ${INSTALL_ROOT}/etc/ffserver.conf  ]
  then  cp  doc/ffserver.conf  ${INSTALL_ROOT}/etc/ffserver.conf
  fi

) > $C_FIFO 2>&1
