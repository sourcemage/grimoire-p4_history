(

  bunzip2  -cd  $SCRIPT_DIRECTORY/gcc-2.95.3-2.patch.bz2  |
  patch  -p 1

  if    [  "$PASCAL"  ==  "y"  ]
  then  sedit  "s/read junk//"  gcc/p/config-lang.in  &&
        sedit  's/for f in `cd p/for f in `cd $(srcdir)\/p/'  gcc/p/Make-lang.in
  fi

  cd $SOURCE_DIRECTORY.bld              &&

  $SOURCE_DIRECTORY/configure           \
               --host=$BUILD            \
               --prefix=/opt/gcc2       \
               --enable-shared          \
               $LANGS                   \
               $OPTS                    &&
  make  bootstrap                       &&
  prepare_install                       && 

  make  install                         &&
  ln    -sf gcc /opt/gcc2/bin/cc        &&

  ln    -sf  ../../../../bin/cpp  \
             /opt/gcc2/lib/gcc-lib/$BUILD/$VERSION/cpp  &&
  ln    -sf  ../opt/gcc2/bin/cpp  /lib/cpp              &&
  # Compatibility lib
  ln    -sf  /opt/gcc2/lib/libstdc++-3-libc6.3-2-2.10.0.so  \
             /opt/gcc2/lib/libstdc++-libc6.2-2.so.3

) > $C_FIFO 2>&1
