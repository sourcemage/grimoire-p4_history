(

cd src

./configure --enable-alsa --prefix=/usr &&
cp $CODEX/audio/pd/makefile . ||
cp $GRIMOIRE_DIR/audio/pd/makefile &&
make depend && 
make && 
make install

) > $C_FIFO 2>&1
