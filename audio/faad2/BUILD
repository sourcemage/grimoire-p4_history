(
	patch -p0 < $SCRIPT_DIRECTORY/patch.faad2	&&
	./bootstrap					&&
	./configure					&&
	make						&&
	prepare_install					&&
	make install

) > $C_FIFO 2>&1


