(

	OPTS="$OPTS --prefix=/usr"
	OPTS="$OPTS $CFG_oldrate $CFG_fastulaw $CFG_fastalaw \
             $CFG_gsm $CFG_ossdsp $CFG_sunaudio"

	patch -p0 < $SCRIPT_DIRECTORY/sox-wave-overflow.patch &&
	./configure	$OPTS	&&
	make			&&
	prepare_install		&&
	make install            &&
        make install-play       &&
        make install-lib

) > $C_FIFO 2>&1
