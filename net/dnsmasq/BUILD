(

  sedit "s/BINDIR = \/usr\/local\/sbin/BINDIR = \/usr\/sbin/" Makefile
  sedit "s/MANDIR = \/usr\/local\/man/MANDIR = \/usr\/man/" Makefile
  sedit "s/gcc -O2 -Wall/gcc $CFLAGS/" Makefile

  make &&
  prepare_install &&
  make install

  cp $SCRIPT_DIRECTORY/dnsmasq.sh /etc/init.d/dnsmasq.sh

ln -fs /etc/init.d/dnsmasq.sh /etc/rc0.d/K10dnsmasq
ln -fs /etc/init.d/dnsmasq.sh /etc/rc1.d/K10dnsmasq
ln -fs /etc/init.d/dnsmasq.sh /etc/rc2.d/K10dnsmasq
ln -fs /etc/init.d/dnsmasq.sh /etc/rc3.d/S60dnsmasq
ln -fs /etc/init.d/dnsmasq.sh /etc/rc4.d/S60dnsmasq
ln -fs /etc/init.d/dnsmasq.sh /etc/rc5.d/S60dnsmasq
ln -fs /etc/init.d/dnsmasq.sh /etc/rc6.d/K10dnsmasq

) > $C_FIFO 2>&1
