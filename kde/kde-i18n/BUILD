my_build() {
  cd $BUILD_SUBDIRECTORY             &&
  ./configure  --build=$BUILD        \
               --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               $OPTS                 &&
  make                               &&
  cd -
}

  for BUILD_SUBDIRECTORY in $SOURCE_DIRECTORY/$SPELL*
  do
    if [ -d $BUILD_SUBDIRECTORY ]
    then
      my_build
    fi
  done
