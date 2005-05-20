export  MOZILLA_OFFICIAL="1"  &&
export  BUILD_OFFICIAL="1"    &&
export  MOZ_THUNDERBIRD="1"   &&

#
# No fast optimization for Mozilla, bit us so many times...
#
export  CFLAGS="${CFLAGS//-O3/-O2}"      &&
export  CXXFLAGS="${CXXFLAGS//-O3/-O2}"  &&

# these two are simply bugs in the Makefile-s
sedit 's#-lgfxshared_s#-L../shared -lgfxshared_s#g' gfx/src/gtk/Makefile.in &&
sedit 's#-lxprintutil#-L../xprintutil -lxprintutil#g' gfx/src/gtk/Makefile.in &&

if  [  "$THUNDERBIRD_MATHML"  =  "y"  ];  then
  OPTS="${OPTS}  --enable-mathml"
else
  OPTS="${OPTS}  --disable-mathml"
fi

if  grep  -q  "\-s"  ${LDFLAGS}
then
  OPTS="${OPTS}  --enable-strip"
fi  &&

mozilla_remove_nspr_nss &&

cp mail/config/mozconfig .mozconfig &&

# Note: --enable-extensions and --enable-necko-protocols are inherited from
# mozconfig.  Don't set them in ./configure unless you *really* know what
# you're doing.
# Also already in mozconfig:
#            export MOZ_THUNDERBIRD=1
#            mk_add_options MOZ_THUNDERBIRD=1
#
#            --enable-crypto                              \
#            --enable-single-profile                      \
#            --disable-tests                              \
#            --disable-oji                                \
#            --disable-necko-disk-cache                   \
#            --disable-profilesharing                     \
#            --disable-activex                            \
#            --disable-activex-scripting                  \
#            --disable-plugins                            \
#            --enable-image-decoders=default,-xbm         \
./configure  --prefix=${INSTALL_ROOT}/usr                 \
             --with-user-appdir=.thunderbird              \
             --with-pthreads                              \
             --disable-accessibility                      \
             --disable-logging                            \
             --disable-calendar                           \
             --disable-pedantic                           \
             --disable-installer                          \
             --disable-debug                              \
             --disable-ldap                               \
             --disable-jsd                                \
             --enable-reorder                             \
             --enable-cpp-rtti                            \
             --enable-optimize="$CFLAGS"                  \
             $OPTS                                        &&
make  MOZ_THUNDERBIRD=1
