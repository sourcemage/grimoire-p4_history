( 
  cd $SOURCE_DIRECTORY &&
  sed -e 's/char \*readline, (char \*)/char \*readline, (const char \*)/g' bc/scan.c > /tmp/scan.l &&
  ./configure --with-readline   &&
  cp /tmp/scan.l ./bc/scan.l      &&
  sed -e 's/char \*readline, (char \*)/char \*readline, (const char \*)/g' bc/scan.c > /tmp/scan.c &&
  cp /tmp/scan.c ./bc/scan.c      &&
  ./configure --prefix=${INSTALL_ROOT}/usr --with-readline   && 
  make                         && 
  prepare_install              && 
  make install 
 
 
) > $C_FIFO 2>&1 
