(
	patch -p1 < $SOURCE_CACHE/$SOURCE2   &&
export LDFLAGS="-L/usr/lib/python2.3/config $LDFLAGS"
	default_build
) > $C_FIFO 2>&1
