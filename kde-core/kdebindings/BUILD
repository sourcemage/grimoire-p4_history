sedit 's/$(dir @qt_includes@)/\/usr/'  python/Makefile.am &&
aclocal                                          &&

make_single                               &&
TMAKEPATH=/usr/share/tmake/lib/linux-g++  \
source  $SECTION_DIRECTORY/KDE_BUILD      &&
make_normal
