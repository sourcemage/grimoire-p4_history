(

cd src &&

./configure --prefix=/usr  \
	    --enable-alsa  \
	    $OPTS           &&

make depend && 
make && 
make install

) > $C_FIFO 2>&1
