(

  cd $SOURCE_DIRECTORY.bld              &&
  $SOURCE_DIRECTORY/configure           \
               --host=$BUILD            \
               --prefix=/usr            \
               --enable-threads=posix   \
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
  ln    -sf  ../usr/bin/cpp  /lib/cpp              &&
#stupid link needed by stupid apps expecting RedHat compat. libs
  ln -sf /usr/lib/libstdc++.so /usr/lib/libstdc++-libc6.2-2.so.3 

) > $C_FIFO 2>&1
