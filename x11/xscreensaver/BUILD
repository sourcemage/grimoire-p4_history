(

  ./configure  --prefix=/usr         \
               $OPTS                 &&
  sedit "6690s/Screensaver/Screensaver Properties/" po/es.po    &&
  sedit "s/^\(datadir =.*\)$/# \1  -- Modified by cast BUILD/" po/Makefile  &&
  sedit "s/^#datadir/datadir/" po/Makefile &&
  sedit "s/-- not for xscreensaver//" po/Makefile &&
  sedit "s/^localedir = \$(datadir)\/locale/localedir = \/usr\/share\/locale/" po/Makefile &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
