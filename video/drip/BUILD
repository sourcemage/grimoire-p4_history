(

  cd  mpeg2dec-0.2.1  &&
  ./configure --without-x --disable-sdl --prefix=$SOURCE_DIRECTORY/libmpeg2  &&
  make  &&
  make install  &&
  cd $SOURCE_DIRECTORY  &&
  export OPTS="$OPTS --with-mpeg2=$SOURCE_DIRECTORY/libmpeg2"          &&
  default_build

) > $C_FIFO 2>&1
