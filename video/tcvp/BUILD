(

  sedit  "s:mpeg2_la_CPPFLAGS = .*:mpeg2_la_CPPFLAGS = -I$SOURCE_DIRECTORY/libmpeg2/include:"  src/codec/mpeg2/Makefile.in  &&
  cd  mpeg2dec-0.3.2-cvs  &&
  ./configure --without-x --disable-sdl --prefix=$SOURCE_DIRECTORY/libmpeg2  &&
  make  &&
  make install  &&
  cd $SOURCE_DIRECTORY  &&
  export OPTS="$OPTS --with-libmpeg2=$SOURCE_DIRECTORY/libmpeg2"          &&
  default_build

) > $C_FIFO 2>&1
