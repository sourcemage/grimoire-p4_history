(

  # Fix for Bug #989
  cd  nsplugins/viewer                                  &&
  patch  -p0  <  ${SCRIPT_DIRECTORY}/nsplugin.cpp.diff  &&
  cd  ${SOURCE_DIRECTORY}                               &&

  ./configure  --prefix=/usr        \
               --sysconfdir=/etc    \
               --localstatedir=/var \
               --disable-debug      \
               --enable-final       \
               $OPTS                &&
  make                              &&
  prepare_install                   &&
  make    install

) > $C_FIFO 2>&1
