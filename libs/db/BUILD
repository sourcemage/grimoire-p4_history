(

  patch  -p0  <  $SCRIPT_DIRECTORY/db.patch   &&

  if  [  -z  $JAVA_HOME  ]
  then
    if  spell_installed  j2sdk
    then
      export  JAVA_HOME=/opt/java/j2sdk
    elif  spell_installed  j2sdk-bin
    then
      export  JAVA_HOME=/usr/lib/j2sdk1.4.1
    fi
  fi

  cd  build_unix                         &&
  PATH=$JAVA_HOME:$PATH                  &&
  ../dist/configure  --prefix=/usr       \
                     --build=$BUILD      \
                     --enable-dynamic    \
                     --enable-compat185  \
                     --enable-cxx        \
                     $OPTS               &&

  make                                   &&
  prepare_install                        &&
  make    install

) > $C_FIFO 2>&1
