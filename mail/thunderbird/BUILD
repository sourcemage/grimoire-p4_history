export  MOZILLA_OFFICIAL="1"  &&
export  BUILD_OFFICIAL="1"    &&
export  MOZ_THUNDERBIRD="1"   &&

# No fast optimization for Mozilla, bit us so many times...
export  CFLAGS="${CFLAGS//-O3/-O2}"      &&
export  CXXFLAGS="${CXXFLAGS//-O3/-O2}"  &&

if  [  "$CRYPTO"  =  "y"  ];  then
  OPTS="${OPTS}  --enable-crypto"
else
  OPTS="${OPTS}  --disable-crypto"
fi  &&

if  grep  -q  "\-s"  ${LDFLAGS}
then
  OPTS="${OPTS}  --enable-strip"
fi  &&

./configure  --prefix=${INSTALL_ROOT}/usr     \
             --with-user-appdir=.thunderbird  \
             --with-pthreads                  \
             --disable-accessibility          \
             --disable-tests                  \
             --disable-debug                  \
             --disable-logging                \
             --enable-reorder                 \
             --disable-pedantic               \
             --enable-cpp-rtti                \
             --enable-extensions=all          \
             --enable-optimize="$CFLAGS"      \
             --disable-calendar               \
             --enable-extensions              \
             --disable-installer              \
             --enable-single-profile          \
             $OPTS                            &&
make  MOZ_THUNDERBIRD=1
