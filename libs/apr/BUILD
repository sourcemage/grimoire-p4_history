(

  # fixes htpasswd breakage
  if [ "$APR_BRANCH" == "0" -a "$APR_CHECKOUT" == "n" ]; then
    patch  -p1  <  $SCRIPT_DIRECTORY/apr-0.9.4-tempdir.patch
  fi  &&

  ./configure \
    --host=$HOST \
    --build=$BUILD \
    --prefix=/usr \
    --includedir=/usr/include/apr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-layout=GNU \
    --enable-threads \
    $OPTS &&

  sedit 's|[^_]off64_t| __off64_t|' include/apr.h &&

  make &&
  prepare_install &&
  make install &&
  ln -fns ./build/libtool /usr/share/apache2/libtool 

) >$C_FIFO 2>&1 
