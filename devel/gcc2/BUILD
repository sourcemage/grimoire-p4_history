(

  bunzip2  -cd  $SCRIPT_DIRECTORY/gcc-2.95.3-2.patch.bz2  |
  patch  -p 1

  if    [  "$PASCAL"  ==  "y"  ]
  then  sedit  "s/read junk//"  gcc/p/config-lang.in  &&
        sedit  's/for f in `cd p/for f in `cd $(srcdir)\/p/'  gcc/p/Make-lang.in
  fi

  mk_source_dir  $SOURCE_DIRECTORY.bld  &&
  cd $SOURCE_DIRECTORY.bld              &&

  $SOURCE_DIRECTORY/configure           \
               --host=$BUILD            \
               --prefix=/opt/gcc2       \
               --enable-shared          \
               $LANG                    &&
  make  bootstrap                       &&
  prepare_install                       && 

  make  install                         &&
  ln    -sf gcc /opt/gcc2/bin/cc        &&

  ln    -sf  ../../../../bin/cpp  \
             /opt/gcc2/lib/gcc-lib/$BUILD/$VERSION/cpp  &&
  ln    -sf  ../opt/gcc2/bin/cpp  /lib/cpp              &&

  rm_source_dir  $SOURCE_DIRECTORY.bld

) > $C_FIFO 2>&1
