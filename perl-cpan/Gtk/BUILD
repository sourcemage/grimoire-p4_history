(
  perl -pi -e '/gdk-pixbuf-config/ && s{(8\|9\|1)}{2|\1}'   Makefile.PL  &&
  perl -pi -e '/CCCMD/             && s{/m;}{/mg;}'       */Makefile.PL  &&
  perl  Makefile.PL  &&
  make               &&
  prepare_install    &&
  make    install

) > $C_FIFO 2>&1
