(

  mv   timidity/config.h  timidity/config.h.original    &&
  sed  "s/local\///"    < timidity/config.h.original >  \
                          timidity/config.h             &&

  ./configure  --prefix=/usr                            \
               --disable-sdltest                        &&
  make                                                  &&
  prepare_install                                       &&
  make    install                                       &&
  cp    -r  timidity  /usr/lib

) > $C_FIFO 2>&1
