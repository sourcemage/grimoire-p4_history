mv   timidity/config.h     timidity/config.h.original     &&
sed  "s/local\///"      <  timidity/config.h.original  >  \
                           timidity/config.h              &&

./configure  --prefix=/usr      \
             --disable-sdltest  \
      $OPTS                     &&
make
