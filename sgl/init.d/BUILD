(

  prepare_install  &&
  cd  $SCRIPT_DIRECTORY  &&
  for  i  in  `ls  *.bz2`;  do
    if  [  !  -f  /etc/init.d/${i/.bz2/''}  ];  then
      bzcat  $SCRIPT_DIRECTORY/$i  > $SOURCE_DIRECTORY/${i/.bz2/''}  &&
      install  -m  755  $SOURCE_DIRECTORY/${i/.bz2/''}  /etc/init.d/${i/.bz2/''}
      # needs more work
      if  [ ! [ "functions"  ==  ${i/.bz2/''} ]] ;  then
        ln  -s  ../init.d/${i/.bz2/''}  /etc/rcS.d/S10${i/.bz2/''}
        ln  -s  ../init.d/${i/.bz2/''}  /etc/rc0.d/K90${i/.bz2/''}
        ln  -s  ../init.d/${i/.bz2/''}  /etc/rc6.d/K90${i/.bz2/''}
      fi
    fi
  done  &&
  cd  -
  #cp  $SCRIPT_DIRECTORY/functions.bz2  /etc/init.d/  &&
  #bzip2  -d  /etc/init.d/functions.bz2

) > $C_FIFO 2>&1
