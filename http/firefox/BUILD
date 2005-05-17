FIREFOX_HOME=${INSTALL_ROOT}/usr/lib/firefox                &&
export  MOZ_PHOENIX=1                                       &&

# No fast optimization for Mozilla, bit us so many times...
export  CFLAGS="${CFLAGS//-O3/-O2}"      &&
export  CXXFLAGS="${CXXFLAGS//-O3/-O2}"  &&

# these two are simply bugs in the Makefile-s
sedit 's#-lgfxshared_s#-L../shared -lgfxshared_s#g' gfx/src/gtk/Makefile.in &&
sedit 's#-lxprintutil#-L../xprintutil -lxprintutil#g' gfx/src/gtk/Makefile.in &&

#
# brain surgery to use out-of-tree NSPR and NSS (mostly for NSS)
#
patch -p1 < $SCRIPT_DIRECTORY/security_manager_makefile.diff &&
rm -fr dbm nsprpub security/nss &&
# exclude DBM for top-level modules and don't build it
sedit 's@\<dbm\>@@g' Makefile.in &&
sedit 's@\<dbm\>@@g' build/unix/modules.mk &&
# don't define NSS libraries as dependencies and don't look for them in the tree
sedit 's@$(DIST)/lib/$(LIB_PREFIX)\(crmf\|dbm\|nss3\|softokn3\|smime3\|ssl3\)\.$(LIB_SUFFIX)@-l\1@g' config/config.mk &&
sedit 's@NSS_DEP_LIBS\s*=@__undefine_\0@g' config/config.mk &&
# align the makefile-s
find -name Makefile.in | while read __MAKEFILE; do
  # use system NSPR's and NSS's headers
  # option `--with-system-nspr' doesn't do it everywhere
  sedit 's@-I\S*\(nss\|nspr\)\>@-I/usr/include/\1@g' $__MAKEFILE
  # point to system NSS libraries
  #sedit 's#$(DLL_PREFIX)\(nss[a-z0-9_]*\|dbm\)$(DLL_SUFFIX)#-l\1#g' $__MAKEFILE
  #sedit 's#$(DIST)/lib/$(LIB_PREFIX)\(nss[a-z0-9_]*\|dbm\)\.$(LIB_SUFFIX)#-l\1#g' $__MAKEFILE
done &&

if  [  -f  /root/.mozconfig  ];  then
  rm  -f  /root/.mozconfig
fi  &&

if  [  "$FIREFOX_SVG"  =  "y"  ];  then
  OPTS="$OPTS  --enable-svg  --enable-svg-renderer-libart"  &&
  export  MOZ_INTERNAL_LIBART_LGPL=1
fi  &&

if [ "$FIREFOX_CVS" == "y" ]; then
  OPTS="$OPTS --enable-application=browser"
fi &&
cp browser/config/mozconfig .mozconfig &&
./configure                                       \
  --prefix=${INSTALL_ROOT}/usr                    \
  --with-user-appdir=.firefox                     \
  --with-x                                        \
  --with-pthreads                                 \
  --enable-reorder                                \
  --enable-cpp-rtti                               \
  --enable-strip                                  \
  --enable-optimize="$CFLAGS"                     \
  --with-default-mozilla-five-home=$FIREFOX_HOME  \
  --disable-debug                                 \
  --disable-tests                                 \
  --disable-installer                             \
  --disable-pedantic                              \
  --disable-mailnews                              \
  --disable-composer                              \
  --enable-crypto                                 \
  --enable-single-profile                         \
  $OPTS                                           &&
make_single                                       &&
make
