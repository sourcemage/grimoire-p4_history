(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&

  cp    src/all-arch.mak       src/all-arch.mak.original
  sed   "s:/usr/local:/usr:g"  src/all-arch.mak.original  >  src/all-arch.mak

  cp    src/unix-gcc.mak  src/unix-gcc.mak.original
  cat                     src/unix-gcc.mak.original  |
  sed   "s:/usr/local:/usr:g"                        |
  sed   "s:JSRCDIR=jpeg:JSRCDIR=jpeg-6b:"            |
  sed   "s:PSRCDIR=libpng:PSRCDIR=libpng-1.2.4:"     |
  sed   "s:PVERSION=10202:PVERSION=10204:"           |
  sed   "s:SHARE_ZLIB=0:SHARE_ZLIB=1:"               >  src/unix-gcc.mak

#  echo  "#include <time.h>"  >>  src/time_.h

  ln    -s  src/unix-gcc.mak  makefile  &&

  make  so                              &&
  prepare_install                       &&
  make  soinstall                       &&
  ln    -sf  gsc  /usr/bin/gs

) > $C_FIFO 2>&1
