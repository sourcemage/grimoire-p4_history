export    CFLAGS="${CFLAGS/-funroll-loops/} -O3"
export  CXXFLAGS="${CXXFLAGS/-funroll-loops/} -O3"
export    CFLAGS="${CFLAGS/-DPIC -fPIC/}"
export  CXXFLAGS="${CFLAGS/-DPIC -fPIC/}"

patch  -p0  <  $SCRIPT_DIRECTORY/ffmpeg.patch   &&
patch  -p1  <  $SCRIPT_DIRECTORY/gcc-3.4.patch  &&
sedit  's:-lpostproc:-Llibpostproc -lpostproc:'  libavcodec/Makefile  &&
sedit  's:-Werror::'  libavformat/Makefile  &&
./configure  --prefix=${INSTALL_ROOT}/usr  \
             --enable-shared               \
             --enable-pp                   \
             --enable-shared-pp            \
             --enable-a52                  \
             --enable-gpl                  \
             $OPTS                         &&
cd  libavcodec/libpostproc  &&
make                        &&
cd  $SOURCE_DIRECTORY       &&
make
