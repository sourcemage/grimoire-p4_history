(

  export    CFLAGS="${CFLAGS/-funroll-loops/} -O3"
  export  CXXFLAGS="${CXXFLAGS/-funroll-loops/} -O3"

  if  grep UTS_RELEASE  /usr/include/linux/version.h | grep -q \"2.6; then
    patch  -p1  <  $SCRIPT_DIRECTORY/linux-2.6.patch
  fi
  patch  -p1  <  $SCRIPT_DIRECTORY/faad2.patch   &&
  patch  -p0  <  $SCRIPT_DIRECTORY/ffmpeg.patch  &&
  sedit  's:-lpostproc:-Llibpostproc -lpostproc:'  libavcodec/Makefile  &&
  sedit  's:-Werror::'  libavformat/Makefile  &&
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
    install  -m  644 libavcodec/dsputil.h      \
                 ${INSTALL_ROOT}/usr/include/ffmpeg  &&
    install  -m  644 libavformat/os_support.h  \
                 ${INSTALL_ROOT}/usr/include/ffmpeg
  )  &&
  
  if    [  !  -f               ${INSTALL_ROOT}/etc/ffserver.conf  ]
  then  cp  doc/ffserver.conf  ${INSTALL_ROOT}/etc/ffserver.conf
  fi

) > $C_FIFO 2>&1
