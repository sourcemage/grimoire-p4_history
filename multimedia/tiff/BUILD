(

cat  <<  EOF  >>  config.site
DIR_BIN="/usr/bin"
DIR_LIB="/usr/lib"
DIR_INC="/usr/include"
DIR_MAN="/usr/man"
DIR_HTML="/usr/doc/tiff"
GCOPTS=""
OPTIMIZER="$CFLAGS"
EOF

  ./configure  --noninteractive  &&
  make                           &&
  prepare_install                &&
  make    install

) > $C_FIFO 2>&1
