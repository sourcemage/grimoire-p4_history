(

  prepare_install  &&
#  cd  $SCRIPT_DIRECTORY  &&
#  for  i  in  `ls  *.bz2`;  do
#    if  [  !  -f  /etc/init.d/${i/.bz2/''}  ];  then
#      bzcat  $SCRIPT_DIRECTORY/$i  > $SOURCE_DIRECTORY/${i/.bz2/''}  &&
#      install  -m  755  $SOURCE_DIRECTORY/${i/.bz2/''}  /etc/init.d/${i/.bz2/''}
#      # needs more work
#      if  [ ! [ "functions"  ==  ${i/.bz2/''} ]] ;  then
#        ln  -s  ../init.d/${i/.bz2/''}  /etc/rcS.d/S10${i/.bz2/''}
#        ln  -s  ../init.d/${i/.bz2/''}  /etc/rc0.d/K90${i/.bz2/''}
#        ln  -s  ../init.d/${i/.bz2/''}  /etc/rc6.d/K90${i/.bz2/''}
#      fi
#    fi
#  done  &&
#  cd  -

  if  [  !  -f  /etc/init.d/functions  ];  then
    install  -m  644  $SCRIPT_DIRECTORY/functions  /etc/init.d
  fi

  # Should create a for loop here for every *.sh file, but we only
  # have one for now, so...
  if  [  !  -f  /etc/init.d/mount.sh  ];  then
    install  -m  755  $SCRIPT_DIRECTORY/mount.sh  /etc/init.d
    ln  -s  /etc/init.d/mount.sh  /etc/rcS.d/S10mount.sh
    ln  -s  /etc/init.d/mount.sh  /etc/rc0.d/K90mount.sh
    ln  -s  /etc/init.d/mount.sh  /etc/rc6.d/K90mount.sh
  fi

) > $C_FIFO 2>&1
