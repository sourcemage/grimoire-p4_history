### configure
	cd $SOURCE_DIRECTORY/config_office/               &&
        CXXFLAGS="${CXXFLAGS} -I/usr/X11R6/include"       &&
	./configure 				          \
		--with-lang=ENUS		          \
		--prefix=${INSTALL_ROOT}/usr	          \
		--sysconfdir=${INSTALL_ROOT}/etc          \
		--localstatedir=${INSTALL_ROOT}/var       \
                --mandir=${INSTALL_ROOT}/usr/share/man    \
                --infodir=${INSTALL_ROOT}/usr/share/info  \
		$OPTS                                     &&

	cd $SOURCE_DIRECTORY                                                                    &&
### drmoriarty's "house of bad hacks" brings updates, distcc, ccache and "some" parallel builds
# if [ "$UPDATED" = "yes" ]; then
# . /etc/sorcery/compile_config                                                                  &&
# if [ -x /usr/bin/distcc ]
# then DIST=distcc
# fi                                                                                             &&
# if [ -x /usr/bin/ccache ]
# then CACHE=ccache
# fi                                                                                             &&
### openssl update
# if [ -f $SOURCE_CACHE/openssl-0.9.7c.tar.gz ]; then
# rm -f openssl/download/openssl-0.9.5a.tar.gz                                                   &&
# cp $SOURCE_CACHE/openssl-0.9.7c.tar.gz openssl/download/                                       &&
# patch -p1 < $SCRIPT_DIRECTORY/openssl.patch
# fi                                                                                             &&
### python update
# if [ -f $SOURCE_CACHE/Python-2.3.2.tgz ]; then
# rm -f python/download/Python-2.2.2.tgz                                                         &&
# cp $SOURCE_CACHE/Python-2.3.2.tgz python/download/                                             &&
# patch -p1 < $SCRIPT_DIRECTORY/python.patch
# fi                                                                                             &&
### db update not working yet, FIXME
#if [ -f $SOURCE_CACHE/db-4.1.25.tar.gz ]; then
#rm -f berkeleydb/download/db-3.2.9.tar.gz                                                      &&
#cp $SOURCE_CACHE/db-4.1.25.tar.gz berkeleydb/download/                                         &&
#patch -p1 < $SCRIPT_DIRECTORY/db.patch
#fi                                                                                             &&
### lets get some parallel building happening 
# export POOPY="$MAKE_NJOBS CC=\"$CACHE $DIST gcc\" DISTCC_HOSTS=\"$DISTCC_HOSTS\""                 &&
# sedit "s:BUILD_ACTION=\$(GNUMAKE):& -j $POOPY:" $SOURCE_DIRECTORY/freetype/makefile.mk         &&
# for i in curl openssl nas 
# do sedit "s:BUILD_ACTION=make:& -j $POOPY:" $SOURCE_DIRECTORY/$i/makefile.mk
# done                                                                                           &&
# sedit "s: make : make -j $POOPY:" $SOURCE_DIRECTORY/python/makefile.mk                         &&
# for i in stlport nas 
# do sedit "s:\$(MAXPROCESS): $POOPY:" $i/makefile.mk
# done                                                                                           &&
# for i in jpeg neon np_sdk expat sablot zlib
# do sedit "s:BUILD_ACTION=dmake:& MAXPROCESS=$POOPY:" $i/makefile.mk
# done                                                                                           &&
# export DISTCC_HOSTS=$(hostname)                                                                &&
# export MAKE_NJOBS=1                                                                                            
# fi                                                                                             &&
### end drmoriarty's ugly hacking spree

  if echo $OPTS| grep -q stlport ;
     then mkdir -p solver/645/unxlngi4.pro/inc                                      &&
          ln -sf /usr/include/stlport solver/645/unxlngi4.pro/inc/stl
  fi                                                                                &&

#
#  Yes, they ignored some of our choices for optimization...
#
sedit  "s:setenv LINK \"gcc\":&\nsetenv CFLAGS \"$CFLAGS\"       \
          \nsetenv CXXFLAGS \"$CXXFLAGS\":"   LinuxIntelEnv.Set  &&

  ./bootstrap                                                                       &&
  tcsh -c "source LinuxIntelEnv.Set && \
           env && \
           dmake" &&
  cd $SOURCE_DIRECTORY/instsetoo/unxlngi4.pro/01/normal	                            &&
  sedit "s:oo_home=OpenOffice.org${VERSION}:oo_home=openoffice:" install                 &&
  chmod +x install