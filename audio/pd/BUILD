(

cd src

./configure --enable-alsa --prefix=/usr &&
cp /var/lib/sorcery/grimoire/audio/pd/makefile . &&
make depend && 
make && 
make install

) > $C_FIFO 2>&1
