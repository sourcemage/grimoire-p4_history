(

  sedit  "s/@CC@/@CC@ $CFLAGS/"           gdchart0.94c/Makefile.in
  sedit  "s/CFLAGS=-O/CFLAGS=$CFLAGS/"    gdchart0.94c/gd-1.8.3/Makefile
  sedit  "s/-O3 -funroll-loops/$CFLAGS/"  gdchart0.94c/gd-1.8.3/libpng-1.2.4/scripts/makefile.linux
  
  cd  gdchart0.94c                         &&
  ./configure                              &&
  cd  gd-1.8.3/libpng-1.2.4                &&
  cp  scripts/makefile.linux  Makefile     &&
  make                                     &&
  cd ../../zlib-1.1.4                      &&
  ./configure                              &&
  make                                     &&
  cd  ..                                   &&
  make                                     &&
  cd  ../ntop                              &&
  ./configure  --prefix=/usr               \
               --localstatedir=/var/cache  \
               $OPTS                       &&
  make                                     &&
  prepare_install                          &&
  make    install                          &&
  mkdir  -p  /var/cache/ntop               &&

  # install config file for init script (if it doesn't already exists)
  if  [  !  -f /etc/sysconfig/ntop  ]  ;  then
    install  -m 644  $SCRIPT_DIRECTORY/init.d/ntop.config  /etc/sysconfig/ntop
  fi

) > $C_FIFO 2>&1
