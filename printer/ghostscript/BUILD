(

  OVERRIDE1="prefix=/usr"
  OVERRIDE2="JSRCDIR=$SOURCE_DIRECTORY/jpeg-6b"

  cp   src/all-arch.mak  src/all-arch.mak.original
  sed  "s/\/local//g"    src/all-arch.mak.original  >  src/all-arch.mak

  cp   src/unix-gcc.mak  src/unix-gcc.mak.original
  cat                    src/unix-gcc.mak.original  |
  sed  "s/SHARE_LIBPNG=0/SHARE_LIBPNG=1/"           |
  sed  "s/SHARE_ZLIB=0/SHARE_ZLIB=1/"               >  src/unix-gcc.mak

  echo   "#include <time.h>"  >>  src/time_.h

  ln   -s  src/unix-gcc.mak  makefile 

  make  $OVERRIDE1  $OVERRIDE2  so         &&
  prepare_install                          &&
  make  $OVERRIDE1  $OVERRIDE2  soinstall  &&
  ln    -sf  gsc  /usr/bin/gs

) > $C_FIFO 2>&1
