(

cd src &&

./configure --prefix=/usr  \
	    --enable-alsa  \
	    $OPTS           &&

sed -i -e s/-Werror// makefile &&

cd ../extra/expr~ &&

sed -i -e s/-Werror// makefile &&

cd ../../src &&

make depend && 
make && 
make install

) > $C_FIFO 2>&1
