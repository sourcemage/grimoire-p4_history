(

   make				&&
   prepare_install		

) > $C_FIFO 2>&1	&&	(

install -c libxosd.so /usr/lib/libxosd.so.0
ln -sf /usr/lib/libxosd.0 /usr/lib/libxosd.so
mkdir -p /usr/lib/xmms/General
cp -a libxmms_osd.so /usr/lib/xmms/General
install -c osd_cat /usr/bin
mkdir -p /usr/man/man1 /usr/man/man3
install -c -m 644 osd_cat.1 /usr/man/man1
install -c -m 644 xosd.3 /usr/man/man3

)



