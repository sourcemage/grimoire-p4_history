(

  cp  $SCRIPT_DIRECTORY/log2cons.sh     \
      $SCRIPT_DIRECTORY/logcolorise.pl  \
      $SCRIPT_DIRECTORY/sunfont.sh      \
      $SCRIPT_DIRECTORY/tailfmessages   \
      $SOURCE_DIRECTORY 
	  
  ./configure --datadir=/share		\
              --mandir=/man		&&

  make                                  &&
  prepare_install                       &&
  make install				&&
 
  if [ -f /etc/init.d/sunfont.sh ]; then 
    echo "script detected"
  else
    cp $SOURCE_DIRECTORY/sunfont.sh /etc/init.d/
    for runlev in 2 3 4 5; do
      cd /etc/rc${runlev}.d
      ln -s ../init.d/sunfont.sh S80sunfont
    done
  fi

  if [ -f /etc/init.d/log2cons.sh ]; then 
    echo "script detected"
  else
    cp $SOURCE_DIRECTORY/log2cons.sh /etc/init.d/
    for runlev in 2 3 4 5; do
      cd /etc/rc${runlev}.d
      ln -s ../init.d/log2cons.sh S10log2cons
    done
  fi

  cp $SOURCE_DIRECTORY/logcolorise.pl /usr/bin/

  cp $SOURCE_DIRECTORY/tailfmessages  /usr/bin/
	
) > $C_FIFO 2>&1
