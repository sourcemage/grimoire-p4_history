(

  cd $SOURCE_DIRECTORY.bld              &&

  $SOURCE_DIRECTORY/configure           \
               --host=$BUILD            \
               --prefix=/usr            \
               --enable-threads=posix   \
	       --enable-__cxa_atexit    \
               $FRONTENDS               \
	       $OPTS                    &&

  make  bootstrap                       &&
  prepare_install                       && 

  if  [  -z  "$FIXEDINCLS"  ]
  then  make  install-no-fixedincludes  &&
        cp  -a  $SOURCE_DIRECTORY/libobjc/objc  /usr/lib/gcc-lib/$BUILD/$VERSION/include
  else  make  install
  fi                                    &&

  ln    -sf gcc /usr/bin/cc             &&
  ln    -sf  ../../../../bin/cpp  \
             /usr/lib/gcc-lib/$BUILD/$VERSION/cpp  &&
  ln    -sf  ../usr/bin/cpp  /lib/cpp

) > $C_FIFO 2>&1
