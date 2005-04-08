patch -p0 < $SCRIPT_DIRECTORY/Makefile.am.patch  &&
aclocal                                          &&

make_single                               &&
TMAKEPATH=/usr/share/tmake/lib/linux-g++  \
source  $SECTION_DIRECTORY/KDE_BUILD      &&
make_normal
