(
  ./bootstrap                           &&
  ./configure  --disable-blenderplugin  \
               --without-gameblender    \
               --enable-shared          \
               --disable-vorbistest     \
               --disable-rpath          \
               $OPTS                    &&
  make                                  &&
  prepare_install                       &&
  make install

) > $C_FIFO 2>&1
