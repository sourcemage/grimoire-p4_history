./configure  &&

if gcc -include linux/in.h -E - < /dev/null | grep -q IPPROTO_SCTP ; then
  echo "" > sctpfix.h
else
  echo "enum { IPPROTO_SCTP = 132 };" > sctpfix.h
fi &&

sedit "s!^CFLAGS =!& -include ${PWD}/sctpfix.h !" Makefile &&

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
