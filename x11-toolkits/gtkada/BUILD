(

  if  !  spell_ok  MesaLib; then
    sedit  "s/-lGLU/-lglut/"  configure
  fi
  ./configure   --host=${HOST}              \
               --build=${BUILD}             \
              --prefix=${INSTALL_ROOT}/usr  \
          --sysconfdir=${INSTALL_ROOT}/etc  \
       --localstatedir=${INSTALL_ROOT}/var  \
                       $OPTS                 &&
  make  GNATFLAGS="$CFLAGS"                  &&
  prepare_install                            &&
  make    install


) > $C_FIFO 2>&1
