(

  cd   makefiles
  cp   Makefile.linux  Makefile.linux.orig
  sed  "s/CFLAGS\=/CFLAGS:=-DBUILD_BROKEN_NEDIT /"  Makefile.linux.orig       |
  sed  "s/-DUSE_LPR_PRINT_CMD/& \$\(CFLAGS\)/"  >        \
       Makefile.linux
  cd   ..
  if  spell_installed  lesstif
  then
    echo  ""  |  make  linux
  else
    make  linux
  fi                                                     &&
  prepare_install

) > $C_FIFO 2>&1  &&  (

  strip      source/nedit
  strip      source/nc
  cp         source/nc         /usr/bin
  cp         source/nedit      /usr/bin
  cp         doc/nc.man        nc.1
  cp         doc/nedit.man     nedit.1
  gzip  -9   nc.1
  gzip  -9   nedit.1
  cp         nc.1.gz           /usr/man/man1
  cp         nedit.1.gz        /usr/man/man1

)
