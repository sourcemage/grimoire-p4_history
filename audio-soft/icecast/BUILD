(
  export CPPFLAGS="-I /usr/include/libxml2/libxml $CPPFLAGS"
  ./autogen.sh                      &&
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
