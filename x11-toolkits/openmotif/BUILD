bzcat  $SCRIPT_DIRECTORY/Makefile.diff.bz2  |  patch  -p0  &&

#
# Append CONFIGURE settings to OPTS
#
OPTS="$OPTS             \
      $OMOTIF_THEMES    \
      $OMOTIF_CATALOG"  &&

./configure  --build=$BUILD      \
            --prefix=/usr/X11R6  \
        --sysconfdir=/etc        \
     --localstatedir=/var        \
             $OPTS               &&
make
