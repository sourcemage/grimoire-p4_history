default_build  &&  (

  if  [  !  -f  /etc/snort.conf  ];  then
    sed  "s/include /include snort\//"  snort.conf  >  /etc/snort.conf
  fi

  mkdir  -p  /etc/snort
  mkdir  -p  /var/log/snort

  if  [  !  -f  /etc/snort/classification.config  ];  then
    cp  classification.config  /etc/snort
  fi

  for  FILE  in  `ls  *.rules`;  do
    if  [  !  -f  /etc/snort/$FILE  ];  then
      cp  $FILE   /etc/snort
    fi
  done

  cp  $SCRIPT_DIRECTORY/snort.sh  /etc/init.d/

  chmod  a+x  /etc/init.d/snort.sh

  ln     -sf  ../init.d/snort.sh  /etc/rc0.d/K60snort
  ln     -sf  ../init.d/snort.sh  /etc/rc1.d/K60snort
  ln     -sf  ../init.d/snort.sh  /etc/rc2.d/K60snort
  ln     -sf  ../init.d/snort.sh  /etc/rc6.d/K60snort
                     
  ln     -sf  ../init.d/snort.sh  /etc/rc3.d/S40snort            
  ln     -sf  ../init.d/snort.sh  /etc/rc4.d/S40snort
  ln     -sf  ../init.d/snort.sh  /etc/rc5.d/S40snort

)
