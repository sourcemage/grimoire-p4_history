(
  DOCDIR=/usr/doc/sourcemage-docs
	
  prepare_install              &&
	cp *.sh /usr/bin             &&
	if [ -d "$DOCDIR" ] ; then
	  rm -rf $DOCDIR
	fi                           &&
	generate-smgl-docs.sh    

) > $C_FIFO 2>&1
