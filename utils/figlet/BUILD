(

  sedit "s/CFLAGS = .*/CFLAGS = $CFLAGS/" Makefile
  sedit "s/DESTDIR = .*/DESTDIR = \/usr\/games/" Makefile
  sedit "s/MANDIR = .*/MANDIR = \/usr\/man\/man6/" Makefile
  sedit "s/DEFAULTFONTDIR = .*/DEFAULTFONTDIR = \/usr\/share\/figlet/" Makefile
  sedit "s/DEFAULTFONTDIR = fonts//" Makefile

  make                    &&

  chmod 755 figlist       &&
  chmod 755 showfigfonts  &&

  prepare_install         &&
  mkdir  -p  /usr/games   &&
  make install            &&
  chown  -R  root.games   \
             /usr/games

) > $C_FIFO 2>&1
