(

	prepare_install			                        &&

	cd       /usr/share/mailman     		        &&
	tar -xzf $SOURCE_CACHE/$SOURCE                  &&
	rm  -fr  `find . -type d -and -name CVS`        &&
	rm  -f   `find . -type f -and -name .cvsignore` &&

	bin/check_perms -f >/dev/null

) > $C_FIFO 2>&1
