(

  patch  -p0  <  $SCRIPT_DIRECTORY/db.patch   &&

  cd  build_unix &&
  ../dist/configure  --prefix=/usr       \
                     --build=$BUILD      \
                     --enable-dynamic    \
                     --enable-compat185  \
                     --enable-cxx        &&

  make                                   &&
  prepare_install                        &&
  make    install

) > $C_FIFO 2>&1
