  cp  $SCRIPT_DIRECTORY/FILES/jed.rc lib  &&

  # enable antialiasing support
  sedit  's:#XRENDERFONTLIBS:XRENDERFONTLIBS:'  src/Makefile.in

  # Fix slang location ( Bug # 1533)
  sedit  's:@SLANG_INC@:-I/usr/include:'  \
    src/Makefile.in                       &&
  sedit  's:@SLANG_LIB@:-L/usr/lib:'      \
    src/Makefile.in                       &&

  JED_ROOT=/var/lib/jed                   &&

  ./configure  --build=$BUILD             \
               --prefix=/usr              \
               --sysconfdir=/etc          \
               --localstatedir=/var       \
               $OPTS                      &&
  make                                    &&
  make  getmail		                     &&
  if    spell_installed xfree86  ;  then
    make xjed
  fi
