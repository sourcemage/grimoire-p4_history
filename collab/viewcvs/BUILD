(
	# target directory is embedded in this patch along with options
	# to use cvsgraph and enscript and some minor changes
	patch -p1 < $SCRIPT_DIRECTORY/$SPELL-$VERSION.patch &&

	if find /usr/share/viewcvs -name "*.conf" > /dev/null 2>&1; then
		NOW=`date +%Y%m%d`
		echo "saving previous configuration using timestamp $NOW"
		
		pushd /usr/share/viewcvs/ > /dev/null &&
		for CONF in `ls -1 *.conf`; do
			cp $CONF ${CONF%.conf}.$NOW.conf;
		done                                 &&
		popd                      > /dev/null
	else
		echo "looking for existing CVS repositories (this may take some time)"
		CVS_CONFIG=/CVSROOT/config,v
		REPOSITORY_LIST=
		LABEL=CVS
		COUNT=0
		for REPOSITORY_PATH in `find / -path *$CVS_CONFIG`; do
			COUNT=$(($COUNT + 1))
			[ -n "$REPOSITORY_LIST" ] && REPOSITORY_LIST="$REPOSITORY_LIST,"
			REPOSITORY_LIST="$REPOSITORY_LIST $LABEL$COUNT : ${REPOSITORY_PATH%${CVS_CONFIG}}"
		done          &&
		if [ -n "$REPOSITORY_LIST" ]; then
			pushd cgi > /dev/null                                            &&

			sed "s/cvs_roots\W*=.*$/cvs_roots =${REPOSITORY_LIST//\//\\/}/" \
				< viewcvs.conf.dist                                         \
				> viewcvs.conf.dist.1                                       &&
			sed "s/default_root\W*=.*$/default_root = ${LABEL}1/"           \
				< viewcvs.conf.dist.1                                       \
				> viewcvs.conf.dist                                         &&
			rm -f viewcvs.conf.dist.1                                       &&

			popd      > /dev/null
		fi
	fi                &&

	prepare_install   &&
	./viewcvs-install

) > $C_FIFO 2>&1
