(

patch -p1 <$SCRIPT_DIRECTORY/ardour.patch &&
./configure --prefix=$INSTALL_ROOT/usr \
	    $OPTS	&&

make && 
make install

) > $C_FIFO 2>&1
