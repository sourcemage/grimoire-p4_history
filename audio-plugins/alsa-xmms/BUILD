(

cd $SOURCE_DIRECTORY/src &&
patch -p0<$SCRIPT_DIRECTORY/alsa.patch &&
cd $SOURCE_DIRECTORY &&
./configure --prefix=/usr \
	    $OPTS	&&

make && 
make install

) > $C_FIFO 2>&1
