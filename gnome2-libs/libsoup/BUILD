(

  mkdir  soup-db3                                         &&
  cd  db-$DBVERSION/build_unix                            &&
  ../dist/configure  --prefix=$SOURCE_DIRECTORY/soup-db3  \
                     --disable-dynamic                    &&
  make                                                    &&
  make  install                                           &&

  cd  $SOURCE_DIRECTORY                                   &&

  OPTS="$OPTS --with-db3=$SOURCE_DIRECTORY/soup-db3"      &&


  sedit s/"nsslibs=\"-lssl3 -lsmime3 -lnss3\""/"nsslibs=\"-lssl3 -lsmime3 -lnss3 -lsoftokn3\""/ \
    configure                                       &&

  ./configure  --build=$BUILD                       \
               --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               --enable-glib2                       \
               --with-libxml=2                      \
               $OPTS                                &&

  # Fix a typo in their generated Makefile...
  # sedit  "s:;;: :"  src/libsoup-apache/Makefile   &&

  make                                              &&
  prepare_install                                   &&
  make    install

) > $C_FIFO 2>&1
