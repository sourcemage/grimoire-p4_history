(

  sedit  "s/^CFLAGS/# CFLAGS/"    Makefile  &&
  sedit  "s/^LDFLAGS/# LDFLAGS/"  Makefile  &&
  sedit  "s/^OO/# OO/"            Makefile  &&

  make              &&
  prepare_install   &&

  install -m 0755 rccrypt /usr/bin   &&
  install -m 0755 rcc     /usr/bin   &&
  install -m 0644 man/man1/rccrypt.1  /usr/share/man/man1

) > $C_FIFO 2>&1
