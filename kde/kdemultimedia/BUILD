(
#  bunzip2 -dc $SCRIPT_DIRECTORY/kdemultimedia-kernelheaders.patch.bz2 | patch -p1 

  ./configure  --prefix=${INSTALL_ROOT}/usr        \
               --sysconfdir=${INSTALL_ROOT}/etc    \
               --localstatedir=${INSTALL_ROOT}/var \
               --disable-debug                     \
	       --enable-final                      \
	       $OPTS                               &&
  make CXXFLAGS="$CXXFLAGS -D__linux__"            &&
  prepare_install                                  &&
  make    install

) > $C_FIFO 2>&1
