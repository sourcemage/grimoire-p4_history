(

./linux/bootstrap &&
./configure --prefix=/usr \
	$OPTS &&
make && 
make install &&

cd source/plugins &&
./configure --prefix=/usr \
	$OPTS &&
make && 
make install  &&

echo -e "\n\nEverything built fine, now you should take a look at 
http://swiki.hfbk-hamburg.de:8888/MusicTechnology/558 for further 
instructions on how to use supercollider."

echo -e "\nInstalling scfront..."

cp -f $SCRIPT_DIRECTORY/scfront.tk /usr/bin/scfront &&
chmod 755 /usr/bin/scfront &&

echo "Done!"

) > $C_FIFO 2>&1  
