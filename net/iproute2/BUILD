./configure  &&
make         &&

if [ "$BUILD_DOCS" = y ] ; then
  patch  -p1  <  $SCRIPT_DIRECTORY/doc.patch  &&
  cd $SOURCE_DIRECTORY/doc                    &&
  make                                        &&
  mkdir -p /usr/share/doc/iproute2
fi
