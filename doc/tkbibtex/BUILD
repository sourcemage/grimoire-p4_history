(

  cp /var/spool/sorcery/$SOURCE  $SOURCE_DIRECTORY                 &&
  cp /var/spool/sorcery/$SOURCE2 $SOURCE_DIRECTORY                 &&
	chmod +x tkbibtex                                                &&
  prepare_install                                                  &&
	mv tkbibtex /usr/bin                                             &&
	mv tkbibtex.1 /usr/man/man1         
	
) > $C_FIFO 2>&1
