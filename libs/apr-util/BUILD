(

  # Determine which DBM should be considered the default
  DBM=sdbm        # sdbm is the dbm bundled with apr-util
  if  spell_installed  gdbm  ;  then  DBM=gdbm  ;  fi
  if  spell_installed  db    ;  then  DBM=db    ;  fi
  OPTS="$OPTS --with-dbm=$DBM"

  patch -p1 < $SCRIPT_DIRECTORY/build.diff &&
  if ! [ -x configure ]; then
    ./buildconf --with-apr=/usr/share/apache2
  fi &&

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

) >$C_FIFO 2>&1 && (

  FIX_PATH_REGEX='s|/usr/src/apr-util-[^/"]*|/usr/share/apache2|' &&
  sedit $FIX_PATH_REGEX /usr/bin/apu-config

)
