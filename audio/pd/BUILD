(

cd src &&

./configure --enable-alsa --prefix=/usr &&

export OPTS=`echo $OPTIMIZATIONS | sed 's/ / -z /g'` &&
export FLAGS=$CFLAGS &&

cp $SCRIPT_DIRECTORY/makefile $SOURCE_DIRECTORY/src/. &&

make depend && 
make && 
make install

) > $C_FIFO 2>&1
