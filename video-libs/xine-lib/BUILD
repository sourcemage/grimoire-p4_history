# use shared libXv, xorg doesn't install a static one and xine's configure
# is too dumb to check for the shared one itself
sedit  's:libXv.a:libXv.so:g' configure  &&
# breaks with lots of stuff, let it use its own CFLAGS
export  CFLAGS=""  &&
default_build
