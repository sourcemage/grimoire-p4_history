(

cd  src/Gnu         &&

./makeauxlibs       &&
./configure  $OPTS  && 
make                &&

cp  -R  $SOURCE_DIRECTORY  /usr/lib/pd/externs/.  &&

ln  -sf  /usr/lib/pd/externs/gem-0.84/Gem.pd_linux  /usr/lib/Gem.pd_linux  &&

) > $C_FIFO 2>&1
