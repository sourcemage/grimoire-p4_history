(

  cp  Makefile.in  Makefile.in.original
  sed  "s/gzip/gzip -f/"  < Makefile.in.original > Makefile.in

 ./configure  --disable-alsa     \
              --prefix=/usr      \
              ${OPTS}            &&
  make                           &&
  # Compile fonts
  cd  ${SOURCE2/.tar.bz2/}       &&
  make                           &&
  cd  ..                         &&
  prepare_install                &&
  yes | make  install            &&

  # Install fonts
  cd  ${SOURCE2/.tar.bz2/}       &&
  install  -m  644  *.pcf.gz     \
  /usr/X11R6/lib/X11/fonts/misc

) > $C_FIFO 2>&1
