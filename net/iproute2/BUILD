./configure  &&

sedit  "s/include $(DEFINES)/include $(DEFINES) -lpthread /"  Makefile  &&

make         &&

# Verify that ip built ok.
if ! test -e ip/ip ; then
  message "${PROBLEM_COLOR}The ip program failed to build.${DEFAULT_COLOR}"
  return 1
fi &&

if  [  "$BUILD_DOCS"  =  y  ];  then
  patch  -p1  <  $SCRIPT_DIRECTORY/doc.patch  &&
  cd $SOURCE_DIRECTORY/doc                    &&
  make                                        &&
  mkdir -p /usr/share/doc/iproute2            &&
  cd $SOURCE_DIRECTORY
fi
