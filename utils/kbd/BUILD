(

  ./configure --datadir=/share  \
              --mandir=/man     &&

  make                          &&
  prepare_install               &&
  make install                  &&
 
  cp $SCRIPT_DIRECTORY/logcolorise.pl /usr/bin/

  cp $SCRIPT_DIRECTORY/tailfmessages  /usr/bin/
	
) > $C_FIFO 2>&1
