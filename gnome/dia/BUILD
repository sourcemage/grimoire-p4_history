(
                                                                                                                           
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install                    &&
  cp -R shapes/Cisco /usr/share/dia/shapes

                                                                                                                           
) > $C_FIFO 2>&1

