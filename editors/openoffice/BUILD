(
	cd $SOURCE_DIRECTORY/config_office/ &&
	./configure 				\
		--enable-libart			\
		--with-jdk-home=${JAVA_HOME}	\
		--with-ant-home=/opt/ant	\
		--with-lang=ENUS		\
		--with-x			\
		--prefix=/usr			\
		--sysconfdir=/etc		\
		--localstatedir=/var		\
		$OPTS				&&

	cd $SOURCE_DIRECTORY &&
	./bootstrap	&&
	tcsh -c "source LinuxIntelEnv.Set; dmake"	&&

	prepare_install				&&

	./install --prefix=/opt	
#	for appl in swriter scalc sdraw simpress smath soffice
#	do
#		rm -f /usr/bin/$appl
#		ln -sf /opt/openoffice/program/$appl /usr/bin/$appl
#	done

)  >  $C_FIFO  2>&1
