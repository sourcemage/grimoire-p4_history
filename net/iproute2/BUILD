./configure  &&
make  &&

if [ "$BUILD_DOCS" = y ] ; then
  cd $SOURCE_DIRECTORY/doc   &&
  make                       &&
  mkdir -p /usr/doc/iproute2
fi
