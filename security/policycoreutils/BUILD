echo CFLAGS = $CFLAGS
sedit  "s:\-g \$(OPTIONS) \-Wall \-O2 \-pipe:${CFLAGS} \$(OPTIONS):"  Makefile
sedit  "s:-Werror: :g" load_policy/Makefile
make
