invoke_gcc

export    CFLAGS="${CFLAGS/-funroll-loops/} -O3"
export  CXXFLAGS="${CXXFLAGS/-funroll-loops/} -O3"
export    CFLAGS="${CFLAGS/-DPIC -fPIC/}"
export  CXXFLAGS="${CXXFLAGS/-DPIC -fPIC/}"

sedit  's:-lpostproc:-Llibpostproc -lpostproc:'  libavcodec/Makefile  &&
sedit  's:-Werror::'  libavformat/Makefile  &&
./configure  --prefix=${INSTALL_ROOT}/usr  \
             --enable-shared               \
             --enable-pp                   \
             --enable-shared-pp            \
             --enable-gpl                  \
             $OPTS                         &&
cd  libavcodec/libpostproc  &&
make                        &&
cd  $SOURCE_DIRECTORY       &&
make
