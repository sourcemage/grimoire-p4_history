export  MOZILLA_OFFICIAL="1"  &&
export  BUILD_OFFICIAL="1"    &&
export  MOZ_THUNDERBIRD="1"   &&

#
# No fast optimization for Mozilla, bit us so many times...
#
export  CFLAGS="${CFLAGS//-O3/-O2}"      &&
export  CXXFLAGS="${CXXFLAGS//-O3/-O2}"  &&

#
# Set extensions to use
#
THUNDERBIRD_EXTENSIONS="wallet,spellcheck,xmlextras"  &&

#
# Set protocols to use
#
NECKO_PROTOCOLS="http,file,jar,viewsource,res,data"  &&

if  [  "$CRYPTO"  =  "y"  ];  then
  OPTS="${OPTS}  --enable-crypto"
else
  OPTS="${OPTS}  --disable-crypto"
fi  &&

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

./configure  --prefix=${INSTALL_ROOT}/usr                 \
             --with-user-appdir=.thunderbird              \
             --with-pthreads                              \
             --disable-accessibility                      \
             --disable-logging                            \
             --disable-calendar                           \
             --disable-pedantic                           \
             --disable-installer                          \
             $OPTS                                        &&
make  MOZ_THUNDERBIRD=1

# already in mozconfig
#             --enable-extensions=$THUNDERBIRD_EXTENSIONS  \
#             --enable-necko-protocols=$NECKO_PROTOCOLS    \
#             --enable-extensions                          \
#             --enable-single-profile                      \
#             --disable-tests                              \
#             --disable-oji                                \
#             --disable-necko-disk-cache                   \
#             --disable-profilesharing                     \

# I want to see these for now
#             --disable-debug                              \
#             --disable-jsd                                \

# try without optimizations first
#             --enable-reorder                             \
#             --enable-cpp-rtti                            \
#             --enable-optimize="$CFLAGS"                  \
