(

  cd  font
  cp  Makefile.in  Makefile.in.original
  sed  "s/gzip/gzip -f/"  < Makefile.in.original > Makefile.in
  cd  ..

 ./configure  --disable-alsa  \
              --prefix=/usr   &&
  make  depend                &&
  make                        &&
  prepare_install             &&
  yes | make  install

) > $C_FIFO 2>&1
