export    CFLAGS="${CFLAGS/-funroll-loops/} -O3"
export  CXXFLAGS="${CXXFLAGS/-funroll-loops/} -O3"
export    CFLAGS="${CFLAGS/-DPIC -fPIC/}"
export  CXXFLAGS="${CFLAGS/-DPIC -fPIC/}"

patch  -p1  <  $SCRIPT_DIRECTORY/faad2.patch    &&
patch  -p1  <  $SCRIPT_DIRECTORY/gcc-3.4.patch  &&
sedit  's:-lpostproc:-Llibpostproc -lpostproc:'  libavcodec/Makefile  &&
./configure  --prefix=${INSTALL_ROOT}/usr  \
             --enable-shared               \
             --enable-pp                   \
             --enable-shared-pp            \
             --enable-a52                  \
             $OPTS                         &&
cd  libavcodec/libpostproc  &&
make                        &&
cd  $SOURCE_DIRECTORY       &&
make
