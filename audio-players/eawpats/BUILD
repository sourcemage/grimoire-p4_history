(
rm -rf  /usr/share/timidity     &&
mkdir   /usr/share/timidity     &&
cp      /var/spool/sorcery/$SOURCE /usr/share/timidity/    &&
cd      /usr/share/timidity     &&

rm $SOURCE              &&
mv eawpats12/* .        &&
rm -r eawpats12/	&&

echo "Should work now... Enjoy a new MIDI experience :)"

) > $C_FIFO 2>&1
