(

cd src &&

./configure --prefix=/usr  \
	    --enable-alsa  \
	    $OPTS           &&

cp $SCRIPT_DIRECTORY/makefile $SOURCE_DIRECTORY/src/. &&

make depend && 
make && 
make install

) > $C_FIFO 2>&1
