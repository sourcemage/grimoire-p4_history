(
  patch -p0 < $SPELL_DIRECTORY/post-3.2.2-kdelibs-ktelnetservice.patch &&
  patch -p1 < $SPELL_DIRECTORY/post-3.2.2-kdelibs-kapplication.patch   &&
  default_build
#  ./configure --prefix=${INSTALL_ROOT}/usr $OPTS &&
#  make                   &&
#  prepare_install        &&
#  make    install        

) > $C_FIFO 2>&1
