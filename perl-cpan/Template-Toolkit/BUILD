(
  # skip gd test. It checks a gif image and GIF is not
  # supported in the current versions of gd.
  #
  patch -p0 < $SCRIPT_DIRECTORY/gd.t.patch &&

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
