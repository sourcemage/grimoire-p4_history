(

  sedit '/mkdir -p $(prefix)\/X11R6\/lib\/X11/d' Makefile
  sedit '/ln -sf ..\/..\/..\/share\/hwdata\/Cards $(prefix)\/X11R6\/lib\/X11\/Cards/d' Makefile
  sed -e s/'ln -s'/'ln -sf'/ -i Makefile
  prepare_install     &&
  make install

) > $C_FIFO 2>&1
