sedit  's:#  include <linux/config.h>::'  src/audio_out/audio_oss_out.c  &&
sedit  's:inline int ff:int ff:'  src/libffmpeg/libavcodec/mpegvideo.h   &&
# use shared libXv, xorg doesn't install a static one and xine's configure
# is too dumb to check for the shared one itself
sedit  's:libXv.a:libXv.so:g' configure  &&
# needed for xvid
export  LDFLAGS="$LDFLAGS -lm"  &&
# breaks with lots of stuff, let it use its own CFLAGS
export  CFLAGS=""  &&
default_build
