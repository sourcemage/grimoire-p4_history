sedit  's/'$'\33''/\\0x1B/g'  load_logos.h  &&
sedit  's/'$'\15''/\\n/g'     load_logos.h  &&
sedit  "s:/local::"           Makefile      &&
sedit  "s/-O2/$CFLAGS/"       Makefile      &&
make    logos-all
