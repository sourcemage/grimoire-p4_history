./configure  &&

if gcc -include netinet/in.h -E - < /dev/null | grep -q IPPROTO_SCTP ; then
  echo "" > sctpfix.h
else
  cat << EOF > sctpfix.h
enum { IPPROTO_SCTP = 132 };
#define IPPROTO_SCTP               IPPROTO_SCTP
EOF
fi &&

sedit "s!^CFLAGS =!& -include ${PWD}/sctpfix.h !" Makefile &&

# this fixes the makefile to not strip shell scripts *sigh*
patch -p0 < $SCRIPT_DIRECTORY/Makefile.patch &&

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
