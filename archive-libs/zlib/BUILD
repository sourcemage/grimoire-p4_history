(

  CFLAGS="$CFLAGS -DPIC -fPIC"

  rm  -f  ${INSTALL_ROOT}/usr/X11R6/include/zlib.h
  rm  -f  ${INSTALL_ROOT}/usr/X11R6/lib/libz.a
  patch  -p0  <  ${SCRIPT_DIRECTORY}/Makefile.patch  &&
  sedit  "s/-O/$CFLAGS/"  Makefile                   &&

  ./configure  --prefix=${INSTALL_ROOT}/usr  \
               --shared       \
               $OPTS	      &&
  make                        &&
  prepare_install             &&
  make    install             &&
  ./configure  --prefix=${INSTALL_ROOT}/usr  \
	       $OPTS	      &&
  make                        &&
  make    install

) > $C_FIFO 2>&1
