  cd $SOURCE_DIRECTORY.bld                                &&
  sed -i -e 's/testsuite//' $SOURCE_DIRECTORY/libstdc++-v3/Makefile.in &&
# now the specific envionment for the C++ library
  $SOURCE_DIRECTORY/libstdc++-v3/configure                \
               --prefix=${INSTALL_ROOT}/usr               \
	       $OPTS                                      &&
# The previous step creates a libtool that injects -lstdc++
# into g++ list of arguments, which of course breaks the
# build. Until GCC team or we figure out a better way to
# generate a correct libtool, we will brain-surgeon it like
# this:
  sed -i -e 's|-lstdc++||g' libtool &&
  make all
