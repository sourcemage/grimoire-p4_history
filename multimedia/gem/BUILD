(

cd src/Gnu	&&

./makeauxlibs 	&&
./configure 	&& 
make		&&

cp -R $SOURCE_DIRECTORY /usr/lib/pd/externs/.	&&

ln -sf /usr/lib/pd/externs/gem-0.84/Gem.pd_linux	/usr/lib/Gem.pd_linux &&

echo "To start PureData with gem, go to /usr/lib and type 'pd -lib Gem'"


) > $C_FIFO 2>&1
