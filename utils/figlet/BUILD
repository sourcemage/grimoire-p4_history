(

  sedit "s/DESTDIR = \/usr\/games/DESTDIR = \/usr\/bin/" Makefile
  sedit "s/DEFAULTFONTDIR = \$(DESTDIR)\/lib\/figlet.dir/DEFAULTFONTDIR = \/usr\/lib\/figlet/" Makefile
  sedit "s/DEFAULTFONTDIR = fonts//" Makefile

  make &&

  chmod 755 figlist &&
  chmod 755 showfigfonts &&

  prepare_install &&
  make install

) > $C_FIFO 2>&1
