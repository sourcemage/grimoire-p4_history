  cd $SOURCE_DIRECTORY.bld                                &&
  sed -i "s/testsuite//" $SOURCE_DIRECTORY/libstdc++-v3/Makefile.in &&
# now the specific envionment for the C++ library
  $SOURCE_DIRECTORY/libstdc++-v3/configure                \
               --prefix=${INSTALL_ROOT}/usr               \
	       $OPTS                                      &&
  make all
