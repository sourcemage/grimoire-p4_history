(

  sedit  "s/-O2/$CXXFLAGS/"  unix/Makefile.in
  cd  builds
  ../unix/configure  --build=$BUILD        \
                     --prefix=/usr         \
                     --sysconfdir=/etc     \
                     --localstatedir=/var  \
                     $OPTS                 &&
  make                                     &&
  prepare_install                          &&
  make    install

) > $C_FIFO 2>&1
