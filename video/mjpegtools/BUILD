# according to http://gcc.gnu.org/bugzilla/show_bug.cgi?id=10077 this should be
# fixed in gcc 3.3.x, but it isn't,
# see http://bugs.sourcemage.org/show_bug.cgi?id=6403
# compiles fine with those settings with gcc 3.4.2, so only disable it for 3.3
if gcc -dumpversion ! grep -q ^3.3; then
  CFLAGS=${CFLAGS/-mfpmath=sse -msse -msse2/}
  CFLAGS=${CFLAGS/pentium4/i686}
fi

# fails to compile with -DPIC and -fPIC
CFLAGS=${CFLAGS/-DPIC/}
CFLAGS=${CFLAGS/-fPIC/}
CXXFLAGS=$CFLAGS

# gcc 3.4 fix
sedit  's/KEEP_SOURCE:/KEEP_SOURCE: ;/'  lavtools/lavpipe.c   &&
sedit  's/(uint8_t \*)/uint8_t */'       mpeg2enc/picture.cc  &&
default_build
