  if [ $OLD_TOO == y ] ; then
    cd $SOURCE_DIRECTORY2                         &&
    ./configure  --build=$BUILD                   \
                 --prefix=${INSTALL_ROOT}/        \
                 --mandir=${INSTALL_ROOT}/usr/share/man \
		 $OPTS                            &&
    make                                          &&
    cd $SOURCE_DIRECTORY
  fi                                              &&

  patch -p1 < $SPELL_DIRECTORY/mk.diff            &&
#  default_build
    ./configure  --build=$BUILD                   \
                 --prefix=${INSTALL_ROOT}/        \
                 --mandir=${INSTALL_ROOT}/usr/share/man \
                 $OPTS                            &&
    make

