(
	#fix optimizations
	cd $SOURCE_DIRECTORY/solenv/inc              &&
	cp unxlngi3.mk unxlngi3.mk.orig              &&
	sed -e "s:^CFLAGSOPT=.*:CFLAGSOPT=$CFLAGS:g" \
	unxlngi3.mk.orig > unxlngi3.mk               &&
	cp unxlngi4.mk unxlngi4.mk.orig              &&
	sed -e "s:\-mcpu=pentiumpro::"               \
	unxlngi4.mk.orig > unxlngi4.mk               &&
        cp unxlngi4.mk unxlngi4.mk.orig              &&
        sed -e "s:^CFLAGSOPT=.*:CFLAGSOPT=$CFLAGS:g" \
        unxlngi4.mk.orig > unxlngi4.mk               &&
	cd $SOURCE_DIRECTORY                         &&
### patch for j2sdk-1.4.2 and 2.6.0* kernels
        patch -p1 < $SCRIPT_DIRECTORY/fix-j2sdk+kernel.patch &&
### configure
	cd $SOURCE_DIRECTORY/config_office/     &&
	./configure 				\
		--enable-libart			\
		--with-jdk-home=${JAVA_HOME}	\
		--with-ant-home=${ANT_HOME}	\
		--with-lang=ENUS		\
		--with-x			\
		--prefix=/usr			\
		--sysconfdir=/etc		\
		--localstatedir=/var		\
		$OPTS				&&

	cd $SOURCE_DIRECTORY                                                                    &&
### drmoriarty's "house of bad hacks" brings updates, distcc, ccache and "some" parallel builds
 if [ "$UPDATED" = "yes" ]; then
 . /etc/sorcery/compile_config                                                                  &&
 if [ -x /usr/bin/distcc ]
 then DIST=distcc
 fi                                                                                             &&
 if [ -x /usr/bin/ccache ]
 then CACHE=ccache
 fi                                                                                             &&
### freetype update 
 if [ -f $SOURCE_CACHE/freetype-2.1.5.tar.bz2 ]; then
 rm -f freetype/download/freetype-2.1.4.tar.gz                                                  &&
 cp $SOURCE_CACHE/freetype-2.1.5.tar.bz2 freetype/download/                                     &&
 bunzip2 freetype/download/freetype-2.1.5.tar.bz2                                               &&
 gzip freetype/download/freetype-2.1.5.tar                                                      &&
 patch -p1 < $SCRIPT_DIRECTORY/freetype.patch
 fi                                                                                             &&
### openssl update
 if [ -f $SOURCE_CACHE/openssl-0.9.7c.tar.gz ]; then
 rm -f openssl/download/openssl-0.9.5a.tar.gz                                                   &&
 cp $SOURCE_CACHE/openssl-0.9.7c.tar.gz openssl/download/                                       &&
 patch -p1 < $SCRIPT_DIRECTORY/openssl.patch
 fi                                                                                             &&
### python update
 if [ -f $SOURCE_CACHE/Python-2.3.2.tgz ]; then
 rm -f python/download/Python-2.2.2.tgz                                                         &&
 cp $SOURCE_CACHE/Python-2.3.2.tgz python/download/                                             &&
 patch -p1 < $SCRIPT_DIRECTORY/python.patch
 fi                                                                                             &&
### db update not working yet, FIXME
#if [ -f $SOURCE_CACHE/db-4.1.25.tar.gz ]; then
#rm -f berkeleydb/download/db-3.2.9.tar.gz                                                      &&
#cp $SOURCE_CACHE/db-4.1.25.tar.gz berkeleydb/download/                                         &&
#patch -p1 < $SCRIPT_DIRECTORY/db.patch
#fi                                                                                             &&
### lets get some parallel building happening 
 export POOPY="$MAKE_NJOBS CC=\"$CACHE $DIST gcc\" DISTCC_HOSTS=\"$DISTCC_HOSTS\""                 &&
 sedit "s:BUILD_ACTION=\$(GNUMAKE):& -j $POOPY:" $SOURCE_DIRECTORY/freetype/makefile.mk         &&
 for i in curl openssl nas 
 do sedit "s:BUILD_ACTION=make:& -j $POOPY:" $SOURCE_DIRECTORY/$i/makefile.mk
 done                                                                                           &&
 sedit "s: make : make -j $POOPY:" $SOURCE_DIRECTORY/python/makefile.mk                         &&
 for i in stlport nas 
 do sedit "s:\$(MAXPROCESS): $POOPY:" $i/makefile.mk
 done                                                                                           &&
 for i in jpeg neon np_sdk expat sablot zlib
 do sedit "s:BUILD_ACTION=dmake:& MAXPROCESS=$POOPY:" $i/makefile.mk
 done                                                                                           &&
 export DISTCC_HOSTS=$(hostname)                                                                &&
 export MAKE_NJOBS=1                                                                                            
 fi                                                                                             &&
### end drmoriarty's ugly hacking spree

  if echo $OPTS| grep -q stlport ;
     then mkdir -p solver/645/unxlngi4.pro/inc                                      &&
          ln -sf /usr/include/stlport solver/645/unxlngi4.pro/inc/stl
  fi                                                                                &&
  sedit "s:setenv LINK \"gcc\":&\nsetenv CFLAGS \"$CFLAGS\"\nsetenv CXXFLAGS \"$CXXFLAGS\":" LinuxIntelEnv.Set &&
  ./bootstrap                                                                       &&
  tcsh -c "source LinuxIntelEnv.Set; env; dmake"                                    &&
  cd $SOURCE_DIRECTORY/instsetoo/unxlngi4.pro/01/normal	                            &&
  cp install install.orig                                                           &&
  sedit "s:oo_home=OpenOffice.org1.1.0:oo_home=openoffice:" install                 &&
  chmod +x install                                                                  &&
  prepare_install				                                    &&
  ./install --prefix=/opt	                                                    &&
  for appl in swriter scalc sdraw simpress smath soffice
  do rm -f /usr/bin/$appl                                &&
     ln -sf /opt/openoffice/program/$appl /usr/bin/$appl
  done
                                                             
)  >  $C_FIFO  2>&1
