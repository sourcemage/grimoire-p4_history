(

  sedit  "s/-O2/$CFLAGS/"  configure                      &&
  sedit "s:\/usr\/local:${INSTALL_ROOT}\/usr:" instman.sh &&
  ./configure  --prefix=${INSTALL_ROOT}/usr               \
               --datadir=${INSTALL_ROOT}/usr/share/elvis  \
               $OPTS linux                                &&
  make                                                    &&
  prepare_install                                         &&
  make    install                                         &&
  ln  -sf  elvis  ${INSTALL_ROOT}/usr/bin/vi

)  >  $C_FIFO  2>&1
