(

  # fixes apache2 segfaulting
  if [ "$APR_BRANCH" == "0" -a "$APR_CHECKOUT" == "n" ]; then
    patch  -p1  <  $SCRIPT_DIRECTORY/apr-util-0.9.4-gcc34.patch
  fi  &&

  ./configure \
    --host=$HOST \
    --build=$BUILD \
    --prefix=/usr \
    --includedir=/usr/include/apr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-layout=GNU \
    $OPTS &&
  make &&
  prepare_install &&
  make install

) >$C_FIFO 2>&1 
