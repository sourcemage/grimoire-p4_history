INSTALLDIR=/usr/lib/transcode/contrib
(

  if [ -d /usr/lib/transcode ]; then
  
    prepare_install                                  &&
    mkdir $INSTALLDIR                                &&
    cp $SCRIPT_DIRECTORY/Makefile $SOURCE_DIRECTORY  &&
    cp -ruv $SOURCE_DIRECTORY $INSTALLDIR            &&
    cd $INSTALLDIR/$SPELL                            &&
	make

  else

    echo  "Need to install transcode first..."

  fi
  
)  >  $C_FIFO  2>&1
