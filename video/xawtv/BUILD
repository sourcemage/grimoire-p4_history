(

  sedit  "s/gzip/gzip -f/"  Makefile.in

 ./configure  --prefix=${INSTALL_ROOT}/usr  \
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
  ${INSTALL_ROOT}/usr/X11R6/lib/X11/fonts/misc

) > $C_FIFO 2>&1
