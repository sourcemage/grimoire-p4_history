# touch the man pages so make doesn't try to rebuild them
  touch *.5 *.8  &&

patch -p1 < $SPELL_DIRECTORY/mk.diff  &&
make_single                           &&

if [ $OLD_TOO == y ] ; then
  cd $SOURCE_DIRECTORY2                                &&
  ./configure  --build=$BUILD                          \
               --prefix=${INSTALL_ROOT}/               \
               --mandir=${INSTALL_ROOT}/usr/share/man  \
                        $OPTS                          &&
  make                                                 &&
  cd $SOURCE_DIRECTORY
fi  &&

#  default_build
./configure  --build=$BUILD                          \
             --prefix=${INSTALL_ROOT}/               \
             --mandir=${INSTALL_ROOT}/usr/share/man  \
             $OPTS                                   &&
make
