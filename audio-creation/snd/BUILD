(

./configure --prefix=/usr \
	    --with-static-xm \
	    $OPTS	&&

make && 
make install &&

mkdir /usr/share/snd 
cp -Rv dlp/ /usr/share/snd/. &&
cp *.scm /usr/share/snd/.  &&

echo "You should get the .snd from 
http://www.notam02.no/arkiv/src/snd/snd_conffile.scm
and put it as your ~/.snd (and customize it if you wish :)"

) > $C_FIFO 2>&1
