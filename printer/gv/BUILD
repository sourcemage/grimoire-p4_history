(

  cp  $SCRIPT_DIRECTORY/gv.man  doc
  cp  $SCRIPT_DIRECTORY/gv.man  source
#  perl  -i  -pe  's/ComplexProgramTarget/ComplexProgramTargetNoMan/'  source/Imakefile  &&
  xmkmf                           &&
  make  Makefiles                 &&
  make				  &&
  prepare_install                 &&
  make  GV_BINDIR=/usr/bin/       \
        GV_DOCDIR=/usr/bin/       \
        GV_LIBDIR=/usr/lib/gv/    \
        GV_MANDIR=/usr/man/man1/  \
        install                   &&
  make  GV_BINDIR=/usr/bin/       \
        GV_DOCDIR=/usr/bin/       \
        GV_LIBDIR=/usr/lib/gv/    \
        GV_MANDIR=/usr/man/man1/  \
        install.man

) > $C_FIFO 2>&1
