(

  if    [  -e  /etc/httpd/httpd.conf   ];  then
    SPELL_ROOT=`grep  '^DocumentRoot'  /etc/httpd/httpd.conf   |  cut  -d\"  -f2`
  elif  [  -e  /etc/httpsd/httpd.conf  ];  then
    SPELL_ROOT=`grep  '^DocumentRoot'  /etc/httpsd/httpd.conf  |  cut  -d\"  -f2`
  else
    SPELL_ROOT=/usr/share
  fi

  cd  ${SOURCE_DIRECTORY}                            &&
  prepare_install                                    &&
  mkdir  -p  ${INSTALL_ROOT}${SPELL_ROOT}/${SPELL}   &&
  cp  -r  *  ${INSTALL_ROOT}${SPELL_ROOT}/${SPELL}/

) > $C_FIFO 2>&1
