(
	OPTS="$OPTS --prefix=/usr"
	OPTS="$OPTS $CFG_debug $CFG_asm $CFG_sse $CFG_3dnow"

	./configure	$OPTS	&&
	make			&&
	prepare_install		&&
	make install

) > $C_FIFO 2>&1
