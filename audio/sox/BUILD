(
	OPTS="$OPTS --prefix=/usr"
	OPTS="$OPTS $CFG_oldrate $CFG_fastulaw $CFG_fastalaw \
             $CFG_gsm $CFG_ossdsp $CFG_sunaudio"

	./configure	$OPTS	&&
	make			&&
	prepare_install		&&
	make install

) > $C_FIFO 2>&1
