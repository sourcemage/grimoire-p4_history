(

  sedit "s:rottlog-\$VERSION:rottlog:" ./install.sh &&
  prepare_install 				   &&
  ./install.sh    				   &&
  cp $SCRIPT_DIRECTORY/sample* /etc/rottlog	   &&
  cp $SCRIPT_DIRECTORY/syslogd /etc/rottlog	   &&
  cp $SCRIPT_DIRECTORY/README.SOURCEMAGE /usr/doc/rottlog

) > $C_FIFO 2>&1
