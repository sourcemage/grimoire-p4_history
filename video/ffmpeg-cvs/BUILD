CFLAGS="${CFLAGS/-funroll-loops/} -O3"
if [[ "$HOST" != x86_64-* ]]; then
  CFLAGS="${CFLAGS/-DPIC -fPIC/}"
fi

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
