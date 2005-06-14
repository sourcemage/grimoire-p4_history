sedit  's:AM_PATH_GTK.*::'  configure.in  &&
for i in `find ./ -name Makefile.in`; do
  sedit  's:.*GTK_CFLAGS.*::'   $i
done  &&
sedit  's:@GTK_CFLAGS@::'  frontend/Makefile.am  &&
aclocal  &&
autoconf &&
default_build
