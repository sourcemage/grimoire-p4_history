sedit  's:#  include <linux/config.h>::'  src/audio_out/audio_oss_out.c  &&
# needed for xvid
export  LDFLAGS="$LDFLAGS -lm"  &&
# breaks with -Os
export  CFLAGS=${CFLAGS/-Os/}  &&
default_build
