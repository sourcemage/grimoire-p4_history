(

  cp  $SCRIPT_DIRECTORY/log2cons.sh     \
      $SCRIPT_DIRECTORY/logcolorise.pl  \
      $SCRIPT_DIRECTORY/sunfont.sh      \
      $SCRIPT_DIRECTORY/tailfmessages   \
      $SOURCE_DIRECTORY 
	  
  ./configure --datadir=/usr/share		\
              --mandir=/usr/share/man	&&

  make                                  &&
  prepare_install                       &&
  make install							&&
  
  cp $SOURCE_DIRECTORY/sunfont.sh /etc/init.d/
  for runlev in 2 3 4 5; do
    cd /etc/rc${runlev}.d
    ln -s ../init.d/sunfont.sh S80sunfont
  done

  cp $SOURCE_DIRECTORY/log2cons.sh /etc/init.d/
  for runlev in 2 3 4 5; do
    cd /etc/rc${runlev}.d
    ln -s ../init.d/log2cons.sh S10log2cons
  done

  cp $SOURCE_DIRECTORY/logcolorise.pl /usr/bin/

  cp $SOURCE_DIRECTORY/tailfmessages  /usr/bin/
	
) > $C_FIFO 2>&1
