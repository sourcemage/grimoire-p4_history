export  MOZILLA_OFFICIAL="1"  &&
export  BUILD_OFFICIAL="1"    &&
export  MOZ_THUNDERBIRD="1"   &&

#
# No fast optimization for Mozilla, bit us so many times...
#
export  CFLAGS="${CFLAGS//-O3/-O2}"      &&
export  CXXFLAGS="${CXXFLAGS//-O3/-O2}"  &&

#if  [  "$CRYPTO"  =  "y"  ];  then
#  OPTS="${OPTS}  --enable-crypto"
#else
  OPTS="${OPTS}  --disable-crypto" &&
#fi  &&

if  [  "$THUNDERBIRD_MATHML"  =  "y"  ];  then
  OPTS="${OPTS}  --enable-mathml"
else
  OPTS="${OPTS}  --disable-mathml"
fi

if  grep  -q  "\-s"  ${LDFLAGS}
then
  OPTS="${OPTS}  --enable-strip"
fi  &&

cp mail/config/mozconfig .mozconfig &&

# Note: --enable-extensions and --enable-necko-protocols are inherited from
# mozconfig.  Don't set them in ./configure.
./configure  --prefix=${INSTALL_ROOT}/usr                 \
             --with-user-appdir=.thunderbird              \
             --with-pthreads                              \
             --disable-accessibility                      \
             --disable-logging                            \
             --disable-calendar                           \
             --disable-pedantic                           \
             --disable-installer                          \
             --disable-debug                              \
             --disable-jsd                                \
             --enable-reorder                             \
             --enable-cpp-rtti                            \
             --enable-optimize="$CFLAGS"                  \
             $OPTS                                        &&
make  MOZ_THUNDERBIRD=1

# Also already in mozconfig:
#             --enable-single-profile                      \
#             --disable-tests                              \
#             --disable-oji                                \
#             --disable-necko-disk-cache                   \
#             --disable-profilesharing                     \
