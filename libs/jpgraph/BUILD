(
	#
	# configure the library not to use image cache
	# and to take fonts from /usr/share/fonts/ttf/
	#
	patch -p1 < $SCRIPT_DIRECTORY/$SPELL.patch &&
	prepare_install                            &&

	mkdir -p    /usr/lib/php/$SPELL            &&
	cp    -fr . /usr/lib/php/$SPELL/

) > $C_FIFO 2>&1
