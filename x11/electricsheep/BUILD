(
  patch -p1 < $SCRIPT_DIRECTORY/prefix.patch &&
   sedit "s/-Werror//" ./mpeg2dec/configure  &&
  # Dirty hack because the configure script
  # does not see the math library when running
  # the test program for libpng 
  env LIBS="-lm ${LIBS}" \
  # End dirty hack
  ./configure --prefix=${INSTALL_ROOT}/usr  \
          --sysconfdir=${INSTALL_ROOT}/etc  \
       --localstatedir=${INSTALL_ROOT}/var  \
                       $OPTS                 &&
  make                                       &&
  prepare_install                            &&
  mkdir -p   ${INSTALL_ROOT}/usr/X11R6/lib/xscreensaver &&
  make    install
) >$C_FIFO  2>&1
