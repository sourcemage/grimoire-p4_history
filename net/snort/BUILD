default_build  &&  (

  echo making directory /etc/snort &&
  mkdir  -p  /etc/snort      &&

  echo making directory /var/log/snort &&
  mkdir  -p  /var/log/snort  &&	

  cd etc &&

  
  for  FILE  in  `ls  *conf*`;  do
    if  [  !  -f  /etc/$FILE  ];  then
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

)
