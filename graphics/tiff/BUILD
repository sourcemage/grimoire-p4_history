cat  <<  EOF  >>  config.site
DIR_BIN="$INSTALL_ROOT/usr/bin"
DIR_LIB="$INSTALL_ROOT/usr/lib"
DIR_INC="$INSTALL_ROOT/usr/include"
DIR_MAN="$INSTALL_ROOT/usr/share/man"
DIR_HTML="$INSTALL_ROOT/usr/doc/tiff"
GCOPTS=""
OPTIMIZER="$CFLAGS"
EOF

./configure  --noninteractive  &&
make
