(
	./configure --prefix=/usr $OPTS 		&&
	patch -p0 < $SCRIPT_DIRECTORY/patch_openh323 	&&
	LD_PRELOAD_OLD="$LD_PRELOAD"                    &&
	unset LD_PRELOAD                                &&
	make						&&
	export LD_PRELOAD="$LD_PRELOAD_OLD"             &&
	prepare_install					&&
	make install
) > $C_FIFO 2>&1
