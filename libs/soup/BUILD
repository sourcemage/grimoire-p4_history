(

  mkdir  soup-db3                                         &&
  cd  db-$DBVERSION/build_unix                            &&
  ../dist/configure  --prefix=$SOURCE_DIRECTORY/soup-db3  \
                     --disable-dynamic                    &&
  make                                                    &&
  make  install                                           &&

  cd  $SOURCE_DIRECTORY                                   &&

  sedit s/"nsslibs=\"-lssl3 -lsmime3 -lnss3\""/"nsslibs=\"-lssl3 -lsmime3 -lnss3 -lsoftokn3\""/ \
    configure                                             &&

  OPTS="$OPTS --with-db3=$SOURCE_DIRECTORY/soup-db3"      &&


  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --disable-glib2       \
               $OPTS                 &&

  # Fix a typo in their generated Makefile...
  sedit  "s:;;: :"  src/libsoup-apache/Makefile  &&

  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
