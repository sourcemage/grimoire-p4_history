(

  if    [  "$( installed_version db  |  cut  -c1  )"  ==  "4"  ]
  then  sedit  "s/db-3/db-4/g"  configure
        sedit  "s/db-3/db-4/g"  configure.in
        sedit  "s/@DB_LIBS@/-ldb-4/"  doc-tools/Makefile.in
  else  sedit  "s/@DB_LIBS@/-ldb-3/"  doc-tools/Makefile.in
  fi

  CFLAGS="$CFLAGS -I/usr/include/gnome-1.0/libguppi"
  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  
  make             &&
  prepare_install  &&
  make    install
  
) > $C_FIFO 2>&1
