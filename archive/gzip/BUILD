  sedit  's:$(prefix)/info:$(prefix)/share/info:'  Makefile.in  &&
  sedit  's:$(prefix)/man:$(prefix)/share/man:'    Makefile.in  &&
  ./configure  --build=$BUILD                \
               --prefix=${TRACK_ROOT}/usr  \
               --bindir=${TRACK_ROOT}/bin  &&
  patch -p0 < $SCRIPT_DIRECTORY/Makefile.patch && 
  make
