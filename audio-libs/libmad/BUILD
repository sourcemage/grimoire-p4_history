(

./configure	--prefix=/usr         \
		$OPTS	&&
make			&&
prepare_install		&&
make install		&&
cp $SCRIPT_DIRECTORY/mad.pc /usr/lib/pkgconfig/

) > $C_FIFO 2>&1
