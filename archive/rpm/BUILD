  export LDFLAGS=${LDFLAGS/-z combreloc/} &&
  export CPPFLAGS="$CPPFLAGS -I/usr/include/python$(installed_version python| cut -c 1-3)" &&
  ./configure --prefix=${INSTALL_ROOT}/usr &&
  make
