aclocal                                               &&
autoconf                                              &&
sedit  's/`date`/`date --utc`/'  configure            &&
OPTS="--with-add-fonts=/usr/X11R6/lib/X11/fonts/TTF,\
/usr/X11R6/lib/X11/fonts/Type1,\
/usr/lib/X11/fonts/misc,\
/usr/lib/X11/fonts/local,\
/usr/X11R6/lib/X11/fonts/TTF,\
/usr/X11R6/lib/X11/fonts/Type1,\
/usr/lib/X11/fonts/misc,\
/usr/lib/X11/fonts/local \
$OPTS"                                                &&

make_single                                           &&
default_build                                         &&
make_normal
