(
  export LDFLAGS=${LDFLAGS/-z combreloc/} &&
  export CPPFLAGS="$CPPFLAGS -I/usr/include/python$(installed_version Python| cut -c 1-3)" &&
  ./configure --prefix=${INSTALL_ROOT}/usr &&
  make             &&
  prepare_install  &&
  make -j 1   install

) > $C_FIFO 2>&1
