(
  unpack $SOURCE2 ${MD5[1]}          &&
  patch -p0 < $SOURCE_CACHE/$SOURCE2 &&

  sedit 's|\(docdir\w*=\w*[^/]*\)/docs|\1/doc/db|' dist/Makefile.in &&

  if  [  -z  $JAVA_HOME  ]
  then
    if  spell_installed  j2sdk
    then
      export  JAVA_HOME=/opt/java/j2sdk
    elif  spell_installed  j2sdk-bin
    then
      export  JAVA_HOME=/usr/lib/j2sdk1.4.1
    fi
  fi &&

  if [ "$DB_OSO_DIRECT" == 'n' ]; then
    patch -p1 < $SCRIPT_DIRECTORY/db_oso_direct.patch
  fi &&

  cd  build_unix                         &&
  PATH=$JAVA_HOME/bin:$PATH              &&
  ../dist/configure  --prefix=/usr       \
                     --build=$BUILD      \
                     --enable-dynamic    \
                     --enable-compat185  \
                     --enable-cxx        \
                     $OPTS               &&

  make                                   &&
  prepare_install                        &&
  make    install

) >$C_FIFO 2>&1
