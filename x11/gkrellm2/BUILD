(
	if [ "$DAEMON_ONLY" = "y" ] ; then
		cd $SOURCE_DIRECTORY/server
	fi										&&
	make									&&
	prepare_install					&&
	make INSTALLROOT=/usr install

) > $C_FIFO 2>&1
