(

  zcat $BUILD_DIRECTORY/$SPELL-$VERSION.tar.gz | tar xvC $BUILD_DIRECTORY &&
  sedit '/mkdir -p $(prefix)\/X11R6\/lib\/X11/d' Makefile
  sedit '/ln -s ..\/..\/..\/share\/hwdata\/Cards $(prefix)\/X11R6\/lib\/X11\/Cards/d' Makefile
  prepare_install     &&
  make install

) > $C_FIFO 2>&1
