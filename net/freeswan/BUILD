(

  # Don't install init scripts.
  sedit  's/ setup / /'  programs/Makefile  &&

  make  INC_USRLOCAL=${INSTALL_ROOT}/usr  programs  &&
  make  INC_USRLOCAL=${INSTALL_ROOT}/usr  module  &&
  prepare_install  &&
  make  INC_USRLOCAL=${INSTALL_ROOT}/usr  INC_DOCDIR=doc  RCDIR=""  install  &&

  MODULESDIR="${INSTALL_ROOT}/lib/modules/$( uname -r )"
  install  -m 644  -D  ./linux/net/ipsec/ipsec.o  \
            ${MODULESDIR}/kernel/net/ipsec/ipsec.o

) > $C_FIFO 2>&1
