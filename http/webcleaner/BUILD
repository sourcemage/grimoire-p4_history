  OPTS="--enable-shared $OPTS"                 &&
  sed -i "s|man/man|share/man/man|"  setup.py  &&
#autoreconf &&
  default_build || 
#  ./configure --prefix=$INSTALL_ROOT/usr $OPTS &&
  python setup.py build  &&
  make
