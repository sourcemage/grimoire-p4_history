(

  ./configure  --prefix=/usr   &&

  sedit  "s/(GNOME_INCLUDEDIR)/(GNOME_INCLUDEDIR)     -I\/usr\/include\/libglade-1.0/"  src/Makefile  &&

  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
