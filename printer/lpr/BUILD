(

 patch  -p1  <  $SCRIPT_DIRECTORY/man_dir.patch
 patch  -p1  <  $SCRIPT_DIRECTORY/lpd_init.patch
 cp 	/etc/printcap	/etc/printcap_bef_lpr_cast
  make                                          &&
  make    install

 install -m755 lpd.init /etc/init.d/lpd
  ln -sf /etc/init.d/lpd /etc/rc0.d/K60lpd
  ln -sf /etc/init.d/lpd /etc/rc1.d/K60lpd
  ln -sf /etc/init.d/lpd /etc/rc2.d/S60lpd
  ln -sf /etc/init.d/lpd /etc/rc3.d/S60lpd
  ln -sf /etc/init.d/lpd /etc/rc5.d/S60lpd
  ln -sf /etc/init.d/lpd /etc/rc6.d/K60lpd
 
 mkdir	-p		/var/spool/lpd
 chmod	775		/var/spool/lpd 	
 chown 	root:daemon	/var/spool/lpd

) > $C_FIFO 2>&1
