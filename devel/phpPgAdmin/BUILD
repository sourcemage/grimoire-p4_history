(

# if    [  -e  ${INSTALL_ROOT}/etc/httpd/httpd.conf   ];  then
#   SPELL_ROOT=`grep  '^DocumentRoot'  ${INSTALL_ROOT}/etc/httpd/httpd.conf   |  cut  -d\"  -f2`
# elif  [  -e  ${INSTALL_ROOT}/etc/httpsd/httpd.conf  ];  then
#   SPELL_ROOT=`grep  '^DocumentRoot'  ${INSTALL_ROOT}/etc/httpsd/httpd.conf  |  cut  -d\"  -f2`
# fi                                                                       &&

# if  [  "${SPELL_ROOT}"  ==  ""  ];  then
#   SPELL_ROOT=/usr/share
# fi                                                                       &&

  SPELL_ROOT=/usr/share                                                    &&
  prepare_install                                                          &&
  mkdir  -p  ${INSTALL_ROOT}${SPELL_ROOT}/${SPELL}                         &&
  cp  -r  *  ${INSTALL_ROOT}${SPELL_ROOT}/${SPELL}/                        &&

  echo  "${SPELL} was installed in ${INSTALL_ROOT}${SPELL_ROOT}/${SPELL}"

) >$C_FIFO 2>&1 && (

  if [ -d /etc/httpd ]; then
    cp $SCRIPT_DIRECTORY/postgresql.conf.default /etc/httpd/
  fi

)
