(

  mk_source_dir  $SOURCE_DIRECTORY.bld  &&
  cd $SOURCE_DIRECTORY.bld              &&

  $SOURCE_DIRECTORY/configure           \
               --host=$BUILD            \
               --prefix=/usr            \
               --enable-threads=posix   \
               $LANG                    &&

  make  bootstrap                       &&
  prepare_install                       && 

  make  install                         &&
  ln    -sf gcc /usr/bin/cc             &&

  ln    -sf  ../../../../bin/cpp  \
             /usr/lib/gcc-lib/$BUILD/$VERSION/cpp  &&
  ln    -sf  ../usr/bin/cpp  /lib/cpp              &&

  rm_source_dir  $SOURCE_DIRECTORY.bld

) > $C_FIFO 2>&1
