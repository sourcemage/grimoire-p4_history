my_build() {
  cd $BUILD_SUBDIRECTORY             &&
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  cd -
}

my_install() {
  cd $BUILD_SUBDIRECTORY             &&
  make    install                    &&
  cd -
}

(
  for BUILD_SUBDIRECTORY in $SOURCE_DIRECTORY/$SPELL*
  do
    if [ -d $BUILD_SUBDIRECTORY ]
    then
      my_build
    fi
  done
  prepare_install
  for BUILD_SUBDIRECTORY in $SOURCE_DIRECTORY/$SPELL*
  do
    if [ -d $BUILD_SUBDIRECTORY ]
    then
      my_install
    fi
  done

) > $C_FIFO 2>&1
