(

  sedit "s/-O2/$CFLAGS/" Makefile &&
  sedit "s/\/local//" Makefile &&

  spell_installed libpng || sedit "s/-DWITH_PNG//" Makefile &&

  echo "#include <time.h>" > tmp_alevt-date.c &&
  cat < alevt-date.c >> tmp_alevt-date.c &&
  mv tmp_alevt-date.c alevt-date.c &&

  make &&
  prepare_install &&
  make install

) > $C_FIFO 2>&1
