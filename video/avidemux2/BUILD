# remove the need for autoconf/automake from the broken Makefile.in
sedit  's!$(ACLOCAL_M4):  $(am__aclocal_m4_deps)!$(ACLOCAL_M4):!'  Makefile.in
sedit  's!$(srcdir)/Makefile.in:  $(srcdir)/Makefile.am  $(am__configure_deps)!$(srcdir)/Makefile.in:!' Makefile.in
sedit  's!$(top_srcdir)/configure:  $(am__configure_deps)!$(top_srcdir)/configure:!' Makefile.in
sedit 's!$(srcdir)/config.h.in:  $(am__configure_deps)!$(srcdir)/config.h.in:!' Makefile.in
# don't compile with -msse by default, not every machine has SSE instructions ;)
if ! echo $CFLAGS | grep -q -- "-msse"; then
  sedit  's/use_builtin=yes/use_builtin=no/'  configure
fi  &&
# this is recommended by the author
CFLAGS=${CFLAGS/-O3/-O2}      &&
CXXFLAGS=${CXXFLAGS/-O3/-O2}  &&
default_build
