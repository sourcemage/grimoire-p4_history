(
  sedit "s/www/www-data/"     Makefile.in &&
  sedit "s/\/www-data/\/www/" Makefile.in &&
  ./configure --prefix=/usr $OPTS         &&
  make                                    &&
  prepare_install                         &&
  make    install                         &&
  mkdir -p /usr/www                       &&
  chown www-data:www-data /usr/www
) > $C_FIFO 2>&1
