(
  perl Makefile.PL                     \
    TT_ACCEPT="y"                      \
    TT_DBI="n"                         \
    TT_PREFIX="/usr/share/tt2"         \
    TT_IMAGES="/usr/share/tt2/images"  &&

  make             &&
  make test        &&
  prepare_install  &&
  make install
) > $C_FIFO 2>&1
