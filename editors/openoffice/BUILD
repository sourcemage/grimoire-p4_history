#
# Setup ANT_HOME and JAVA_HOME in case they were just installed
#
if  [  -f  /etc/profile.d/java.sh  ];  then
  source  /etc/profile.d/java.sh
fi  &&

if  [  -f  /etc/profile.d/ant.sh  ];  then
  source  /etc/profile.d/ant.sh
fi  &&

#
# Tell OO where Java and Ant are located
# Only supports US English right now. :(
#
OPTS="$OPTS                         \
      --with-jdk-home=${JAVA_HOME}  \
      --with-ant-home=${ANT_HOME}   \
          --with-lang=ENUS          \
          --with-dict=ENUS"         &&

#
# Included library updates: openssl and Python
#
if  [  "$OO_UPDATED"  =  "y"  ];  then
  local  OO_OPENSSL  OO_PYTHON  OO_DB  &&
  OO_OPENSSL=openssl-0.9.7e.tar.gz     &&
   OO_PYTHON=Python-2.4.tgz            &&
       OO_DB=db-4.3.21.tar.gz          &&

  #
  #  OpenSSL update
  #
  if  [  -f  $SOURCE_CACHE/$OO_OPENSSL  ];  then
    rm  -f  openssl/download/openssl-0.9.5a.tar.gz   &&
    cp  $SOURCE_CACHE/$OO_OPENSSL  openssl/download  &&
    patch  -p1  <  $SCRIPT_DIRECTORY/openssl.patch
  fi  &&

  #
  #  Python update
  #
  if  [  -f  $SOURCE_CACHE/$OO_PYTHON  ];  then
    rm  -f  python/download/Python-2.2.2.tgz       &&
    cp  $SOURCE_CACHE/$OO_PYTHON  python/download  &&
    patch  -p1  <  $SCRIPT_DIRECTORY/python.patch
  fi

  #
  #  DB update  (untested)
  #
  #if  [  -f  $SOURCE_CACHE/$OO_DB  ];  then
  #  rm  -f  berkeleydb/download/db-3.2.9.tar.gz    &&
  #  cp  $SOURCE_CACHE/$OO_DB  berkeleydb/download  &&
  #  patch  -p1  <  $SCRIPT_DIRECTORY/db.patch
  #fi

fi  &&
#
#  End OO_UPDATED
#

#
# Parallel build "fixes"
#
source  /etc/sorcery/compile_config  &&

local  OO_PARALLEL                                   &&
OO_PARALLEL="$MAKE_NJOBS CC=\"ccache  distcc  gcc\"  \
             DISTCC_HOSTS=\"$DISTCC_HOSTS\""         &&

sedit  "s:BUILD_ACTION=\$(GNUMAKE):& -j $OO_PARALLEL:"  freetype/makefile.mk  &&

for  oo_lib  in  curl  openssl  nas;  do
  sedit  "s:BUILD_ACTION=make:& -j $OO_PARALLEL:"  $oo_lib/makefile.mk
done  &&

sedit  "s: make : make -j $OO_PARALLEL:"  python/makefile.mk   &&

for  oo_lib  in  stlport  nas;  do
  sedit  "s:\$(MAXPROCESS):  $OO_PARALLEL:"  $oo_lib/makefile.mk
done  &&

for  oo_lib  in  jpeg  neon  np_sdk  expat  sablot  zlib;  do
  sedit  "s:BUILD_ACTION=dmake:& MAXPROCESS=$OO_PARALLEL:"  $oo_lib/makefile.mk
done  &&

#
# Set DISTCC_HOSTS and MAKE_NJOBS back
#
DISTCC_HOSTS=   &&
  MAKE_NJOBS=1  &&

#
# End Parallel build "fixes"
#

#
# Set OO to use our optimizations
#
sedit  "s:^CFLAGSOPT=.*:CFLAGSOPT=$CFLAGS:g"  solenv/inc/unxlngi3.mk  &&
sedit  "s:\-mcpu-pentiumpro::"                solenv/inc/unxlngi4.mk  &&
sedit  "s:^CFLAGSOPT=.*:CFLAGSOPT=$CFLAGS:g"  solenv/inc/unxlngi4.mk  &&

cd  config_office                                    &&
./configure --prefix=${INSTALL_ROOT}/usr             \
        --sysconfdir=${INSTALL_ROOT}/etc             \
     --localstatedir=${INSTALL_ROOT}/var             \
            --mandir=${INSTALL_ROOT}/usr/share/man   \
           --infodir=${INSTALL_ROOT}/usr/share/info  \
                     $OPTS                           &&
cd  ..                                               &&
#
#  Yes, they ignored some of our choices for optimization...
#
sedit  "s:setenv LINK \"gcc\":&\nsetenv CFLAGS \"$CFLAGS\"       \
          \nsetenv CXXFLAGS \"$CXXFLAGS\":"   LinuxIntelEnv.Set  &&

tcsh  -c  "source  LinuxIntelEnv.Set  &&  \
           ./bootstrap                &&  \
           dmake                      &&  \
           rehash"
