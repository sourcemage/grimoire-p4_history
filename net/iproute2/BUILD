./configure  &&

sedit  "s/include $(DEFINES)/include $(DEFINES) -lpthread /"  Makefile  &&

make         &&

if  [  "$BUILD_DOCS"  =  y  ];  then
  patch  -p1  <  $SCRIPT_DIRECTORY/doc.patch  &&
  cd $SOURCE_DIRECTORY/doc                    &&
  make                                        &&
  mkdir -p /usr/share/doc/iproute2            &&
  cd $SOURCE_DIRECTORY
fi
