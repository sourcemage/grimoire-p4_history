(

./autogen.sh &&
./configure --prefix=/usr  \
	    --disable-portaudio \
	    $OPTS           &&

make && 
make install

) > $C_FIFO 2>&1
