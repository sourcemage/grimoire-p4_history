(
  if [ "$CVS" = "yes" ] ; then ./autogen.sh; fi   &&

  ./configure  --build=$BUILD                     \
               --prefix=/usr                      \
               --sysconfdir=/etc                  \
               --localstatedir=/var               \
               $OPTS                              &&
  make                                            &&
  cd $SOURCE_DIRECTORY                            &&
  prepare_install                                 &&
  make    install
) > $C_FIFO 2>&1
