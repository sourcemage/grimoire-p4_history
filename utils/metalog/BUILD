default_build  &&

(

  if  [  !  -f  /etc/metalog.conf  ];  then
    cp  metalog.conf  /etc
  fi

  cp  $SCRIPT_DIRECTORY/metalog.sh  /etc/init.d
  ln      -sf ../init.d/metalog.sh  /etc/rcS.d/S20metalog
  ln      -sf ../init.d/metalog.sh  /etc/rc0.d/K70metalog
  ln      -sf ../init.d/metalog.sh  /etc/rc6.d/K70metalog

)
