(

  patch  -p1  <  $SCRIPT_DIRECTORY/dotdotpatch.diff

  ./configure  --build=$BUILD     \
               --prefix=/usr      \
               --libexecdir=/bin  \
               --bindir=/bin      &&
  make                            &&
  prepare_install                 &&
  cp  src/tar        /bin         &&
  cp  doc/tar.info*  /usr/info    &&
  install-info  --info-dir=/usr/info  /usr/info/tar.info &&
  cp $SCRIPT_DIRECTORY/tar.1.gz /usr/man/man1

) > $C_FIFO 2>&1
