(

  cd $SOURCE_DIRECTORY.bld              &&

  $SOURCE_DIRECTORY/configure           \
               --host=$BUILD            \
               --prefix=/usr            \
               --enable-threads=posix   \
               $LANG                    &&

  make  bootstrap                       &&
  prepare_install                       && 

  unset  LD_PRELOAD                     &&
  make  install                         &&
  ln    -sf gcc /usr/bin/cc             &&

  ln    -sf  ../../../../bin/cpp  \
             /usr/lib/gcc-lib/$BUILD/$VERSION/cpp  &&
  ln    -sf  ../usr/bin/cpp  /lib/cpp

) > $C_FIFO 2>&1
