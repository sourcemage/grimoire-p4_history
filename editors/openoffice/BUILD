(
 if  [  -z  $JAVA_HOME  ]
   then
     if  spell_installed  j2sdk
     then
      export  JAVA_HOME=/usr/java/j2sdk
     elif  spell_installed  j2sdk-bin
     then
      export  JAVA_HOME=/usr/lib/j2sdk1.4.1
     fi
 fi                                     &&
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


	cd $SOURCE_DIRECTORY/config_office/ &&
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
        if echo $OPTS| grep -q stlport ;
           then mkdir -p solver/645/unxlngi4.pro/inc                                      &&
           ln -sf /usr/include/stlport solver/645/unxlngi4.pro/inc/stl
        fi                                                                                &&
	./bootstrap	                                                                  &&
	tcsh -c "source LinuxIntelEnv.Set; dmake"	                                  &&

	cd $SOURCE_DIRECTORY/instsetoo/unxlngi4.pro/01/normal	                          &&
	cp install install.orig                                                           &&
	sed -e "s:oo_home=OpenOffice.org1.1.0:oo_home=openoffice:" install.orig > install &&
	chmod +x install                                                                  &&

	prepare_install				                                          &&

	./install --prefix=/opt	                                                          &&
	for appl in swriter scalc sdraw simpress smath soffice
	do
		rm -f /usr/bin/$appl
		ln -sf /opt/openoffice/program/$appl /usr/bin/$appl
	done

)  >  $C_FIFO  2>&1
