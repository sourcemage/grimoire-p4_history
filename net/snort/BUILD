default_build  &&  (

  echo making directory /etc/snort &&
  mkdir  -p  /etc/snort      &&

  echo making directory /var/log/snort &&
  mkdir  -p  /var/log/snort  &&	

  cd etc &&

  
  for  FILE  in  `ls  *conf*`;  do
    if  [  !  -f  /etc/snort/$FILE  ];  then
      echo installing etc/$FILE to /etc &&
      /usr/bin/install -c -m 644  $FILE  /etc
    fi
  done &&

  sedit "s:../rules:/etc/snort/:" /etc/snort.conf &&

  cd .. &&

  cd rules &&

  for  FILE  in  `ls  *.rules`;  do
    if  [  !  -f  /etc/snort/$FILE  ];  then
      echo installing rules/$FILE to /etc/snort &&
      /usr/bin/install -c -m 644  $FILE   /etc/snort
    fi
  done &&


 (
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
)
