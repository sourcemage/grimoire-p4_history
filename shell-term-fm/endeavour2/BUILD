(

  ./configure  Linux  --prefix=${INSTALL_ROOT}/usr  --CFLAGS="$CFLAGS"  $OPTS	&&
  sedit "s/gmake/make/" Makefile                                &&
### addding -lstdc++ so it finds the g++ symbols needed by some object files
  sedit "s/..\/fio.o/& -lstdc++/" endeavour2/utils/Makefile     &&
  make    all							&&
  prepare_install  						&&
  make    install  						&&
  if  [ -d ${INSTALL_ROOT}/usr/share/endeavour2/ ] 
  then cp      endeavour2-mimetypes/mimetypes.ini  \
         ${INSTALL_ROOT}/usr/share/endeavour2/mimetypes.ini
  fi
) > $C_FIFO 2>&1
