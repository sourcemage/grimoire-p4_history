( 

 OVERRIDE="CFLAGS\=\"-O3 -DHAVE_LIBXPM -DHAVE_LIBPNG -DHAVE_LIBJPEG  -DHAVE_LIBFREETYPE\" LIBS\=\"-lgd -lpng -lz -ljpeg -lfreetype -lm\""
 sedit "s/^CFLAGS=.*$/CFLAGS=-O3 -DHAVE_LIBXPM -DHAVE_LIBPNG -DHAVE_LIBJPEG  -DHAVE_LIBFREETYPE/" Makefile
 sedit "s/^LIBS=.*$/LIBS=-lgd -lpng -lz -ljpeg -lfreetype -lm/" Makefile
 sedit  "s/\/usr\/local/\/usr/g"           Makefile

  make  "$OVERRIDE" all      &&
  prepare_install            &&
  make  "$OVERRIDE" install

) > $C_FIFO 2>&1

