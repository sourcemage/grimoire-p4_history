(

  sedit  "s/@CC@/@CC@ $CFLAGS/"           gdchart0.94c/Makefile.in
  sedit  "s/CFLAGS=-O/CFLAGS=$CFLAGS/"    gdchart0.94c/gd-1.8.3/Makefile
  sedit  "s/-O3 -funroll-loops/$CFLAGS/"  gdchart0.94c/gd-1.8.3/libpng-1.2.1/scripts/makefile.linux
  
  cd  gdchart0.94c                         &&
  ./configure                              &&
  cd  gd-1.8.3/libpng-1.2.1                &&
  cp  scripts/makefile.linux  Makefile     &&
  make                                     &&
  cd ../../zlib-1.1.4                      &&
  ./configure                              &&
  make                                     &&
  cd  ..                                   &&
  make                                     &&
  cd  ../ntop                              &&
  ./autogen.sh							   &&
  ./configure  --prefix=/usr               \
               --localstatedir=/var/cache  \
               $OPTS                       &&
  make                                     &&
  prepare_install                          &&
  make    install                          &&
  mkdir  -p  /var/cache/ntop

) > $C_FIFO 2>&1  && (

  if  [  "$NTOP_BOOT"  ==  "y"  ];  then

    cp  $SCRIPT_DIRECTORY/ntop.sh  /etc/init.d

    ln  -sf  ../init.d/ntop.sh  /etc/rc0.d/K10ntop
    ln  -sf  ../init.d/ntop.sh  /etc/rc1.d/K10ntop
    ln  -sf  ../init.d/ntop.sh  /etc/rc2.d/K10ntop
    ln  -sf  ../init.d/ntop.sh  /etc/rc6.d/K10ntop

    ln  -sf  ../init.d/ntop.sh  /etc/rc3.d/S90ntop
    ln  -sf  ../init.d/ntop.sh  /etc/rc4.d/S90ntop
    ln  -sf  ../init.d/ntop.sh  /etc/rc5.d/S90ntop

  fi

)
