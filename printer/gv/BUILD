(

  cp  $SCRIPT_DIRECTORY/gv.man  doc
  cp  $SCRIPT_DIRECTORY/gv.man  source

# I'm not sure why this is here -- Jason
#  perl  -i  -pe  's/ComplexProgramTarget/ComplexProgramTargetNoMan/'  source/Imakefile  &&

  patch  -p1  <  $SCRIPT_DIRECTORY/asa-0000.gv-3.5.8.patch  &&
  xmkmf                                                     &&
  make  Makefiles                                           &&
  make				                            &&
  prepare_install                                           &&
  make  GV_BINDIR=/usr/bin/                                 \
        GV_DOCDIR=/usr/bin/                                 \
        GV_LIBDIR=/usr/lib/gv/                              \
        GV_MANDIR=/usr/man/man1/                            \
        install                                             &&
  make  GV_BINDIR=/usr/bin/                                 \
        GV_DOCDIR=/usr/bin/                                 \
        GV_LIBDIR=/usr/lib/gv/                              \
        GV_MANDIR=/usr/man/man1/                            \
        install.man

) > $C_FIFO 2>&1
