### our distcc wrapper causes a failure  in the config module
### but it can be re-enabled after. This function handles it.
function want_parallel() {
        . /etc/sorcery/compile_config           &&
        if [ -n "$DISTCC_HOSTS" ] && [ -x /usr/bin/distcc ] ; then
             DISTCC=distcc
          if ! echo $DISTCC_HOSTS | grep -q localhost
             then if ! echo $DISTCC_HOSTS | grep -q 127.0.0.1;
                  then if ! echo $DISTCC_HOSTS | grep -q $(hostname)
                       then DISTCC_HOSTS="$(hostname) $DISTCC_HOSTS"
                       fi
                  fi
          else
             DISTCC_HOSTS=$DISTCC_HOSTS
          fi
             export DISTCC_VERBOSE=0
             export DISTCC_LOG=/dev/null
             export DISTCC_HOSTS=$DISTCC_HOSTS
        else
             export DISTCC=""
        fi                                      &&
        if [ "$CCACHE" = "on" ] && [ -x /usr/bin/ccache ] ; then
             CCACHE=ccache

             export CCACHE_DIR=/var/cache/compiler
        else
             export CCACHE=""
        fi
        }

(
	#fix optimizations
	cd $SOURCE_DIRECTORY/solenv/inc &&
	cp unxlngi3.mk unxlngi3.mk.orig &&
	sed -e "s:^CFLAGSOPT=.*:CFLAGSOPT=$CFLAGS:g" \
	unxlngi3.mk.orig > unxlngi3.mk  &&
	cp unxlngi4.mk unxlngi4.mk.orig &&
	sed -e "s:\-mcpu=pentiumpro::" \
	unxlngi4.mk.orig > unxlngi4.mk  &&
        cp unxlngi4.mk unxlngi4.mk.orig &&
        sed -e "s:^CFLAGSOPT=.*:CFLAGSOPT=$CFLAGS:g" \
        unxlngi4.mk.orig > unxlngi4.mk  &&

### drmoriarty's "house of bad hacks" brings updates, distcc, ccache and "some" parallel builds
want_parallel                                                                                                      &&
cd $SOURCE_DIRECTORY                                                                                               &&
### freetype update 
if [ -f $SOURCE_CACHE/freetype-2.1.5.tar.bz2 ]; then
rm -f freetype/download/freetype-2.1.4.tar.gz                                                                      &&
cp $SOURCE_CACHE/freetype-2.1.5.tar.bz2 freetype/download/                                                         &&
bunzip2 freetype/download/freetype-2.1.5.tar.bz2                                                                   &&
gzip freetype/download/freetype-2.1.5.tar                                                                          &&
sedit "s/TARFILE_NAME=freetype-2.1.4/TARFILE_NAME=freetype-2.1.5/" freetype/makefile.mk                            &&
sedit "s/2.1.4/2.1.5/g" freetype/freetype-2.1.4.patch
fi                                                                                                                 &&
### openssl update
if [ -f $SOURCE_CACHE/openssl-0.9.7c.tar.gz ]; then
rm -f openssl/download/openssl-0.9.5a.tar.gz                                                                       &&
cp $SOURCE_CACHE/openssl-0.9.7c.tar.gz openssl/download/                                                           &&
sedit "s/TARFILE_NAME=openssl-0.9.5a/TARFILE_NAME=openssl-0.9.7c/" openssl/makefile.mk                             &&
sedit "s/PATCH_FILE_NAME/\#PATCH_FILE_NAME/" openssl/makefile.mk
fi                                                                                                                 &&
### python update
if [ -f $SOURCE_CACHE/Python-2.3.2.tgz ]; then
rm -f python/download/Python-2.2.2.tgz                                                                             &&
cp $SOURCE_CACHE/Python-2.3.2.tgz python/download/                                                                 &&
sedit "s/PYMINOR=2/PYMINOR=3/" python/pyversion.mk                                                                 &&
sedit "s/2.2/2.3/g" python/prj/d.lst                                                                               &&
sedit "s/PATCH_FILE_NAME/\#PATCH_FILE_NAME/" python/makefile.mk                                                    &&
export POOPY=$SOURCE_DIRECTORY                                                                                     &&
sedit "s:..\/python\-inst:$POOPY\/python\/unxlngi4.pro\/misc\/build\/python\-inst:" python/makefile.mk
sedit "s/libpython,UNXSUFFIX,.2.2.2/libpython,UNXSUFFIX,.2.3.2/" scp/source/python/python.scp                      &&
sedit "s/Name = \"python-core-2.2.2.zip\"/Name = \"python-core-2.3.2.zip\"/" scp/source/python/python.scp          &&
sedit "s/python-core-2.2.2/python-core-2.3.2/" scp/source/python/unxbasic_python.scp
fi                                                                                                                 &&
### lets get some parallel building happening 
sedit "s/BUILD_ACTION=\$(GNUMAKE)/& -j $MAKE_NJOBS DISTCC_HOSTS=\"$DISTCC_HOSTS\"/" $SOURCE_DIRECTORY/freetype/makefile.mk &&
for i in curl openssl nas
do sedit "s/BUILD_ACTION=make/& -j $MAKE_NJOBS DISTCC_HOSTS=\"$DISTCC_HOSTS\"/" $SOURCE_DIRECTORY/$i/makefile.mk
done                                                                                                               &&
sedit "s/ make / make -j $MAKE_NJOBS DISTCC_HOSTS=\"$DISTCC_HOSTS\"/" $SOURCE_DIRECTORY/python/makefile.mk         &&
for i in stlport nas 
do sedit "s/\$(MAXPROCESS)/ $MAKE_NJOBS/" $i/makefile.mk
done                                                                                                               &&
for i in jpeg neon np_sdk expat sablot zlib
do sedit "s/BUILD_ACTION=dmake/& MAXPROCESS=$MAKE_NJOBS/" $i/makefile.mk
done                                                                                                               &&
### end drmoriarty's ugly hacking spree



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

	cd $SOURCE_DIRECTORY                                                              &&
### more drmoriarty hacks to setup distcc ccache and flags 
        sedit "s:setenv CC \":&$CCACHE $DISTCC :" LinuxIntelEnv.Set                       &&
        sedit "s:setenv CXX \":&$CCACHE $DISTCC :" LinuxIntelEnv.Set                      &&
        sedit "s:setenv LINK \"gcc\":&\nsetenv CFLAGS \"$CFLAGS\"\nsetenv CXXFLAGS \"$CXXFLAGS\":" LinuxIntelEnv.Set  &&
	./bootstrap	                                                                  &&
        export DISTCC_HOSTS=$DISTCC_HOSTS &&
        tcsh -c "source LinuxIntelEnv.Set; env; dmake"    &&
	cd $SOURCE_DIRECTORY/instsetoo/unxlngi4.pro/01/normal	                          &&
	cp install install.orig                                                           &&
	sedit "s:oo_home=OpenOffice.org1.1.0:oo_home=openoffice:" install                 &&
	chmod +x install                                                                  &&
	prepare_install				                                          &&
	./install --prefix=/opt	                                                          &&
	for appl in swriter scalc sdraw simpress smath soffice
	do
		rm -f /usr/bin/$appl
		ln -sf /opt/openoffice/program/$appl /usr/bin/$appl
	done
                                                             
)  >  $C_FIFO  2>&1
