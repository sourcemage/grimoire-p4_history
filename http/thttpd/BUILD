(
  sedit "s/www/www-data/"     Makefile.in &&
  sedit "s/\/www-data/\/www/" Makefile.in &&
  ./configure --prefix=/usr               &&
  make                                    &&
  prepare_install                         &&
  make    install
) > $C_FIFO 2>&1
