if    [  -e  ${INSTALL_ROOT}/etc/httpd/httpd.conf   ];  then
  SPELL_ROOT=`grep  '^DocumentRoot'  ${INSTALL_ROOT}/etc/httpd/httpd.conf   |  cut  -d\"  -f2`
elif  [  -e  ${INSTALL_ROOT}/etc/httpsd/httpd.conf  ];  then
  SPELL_ROOT=`grep  '^DocumentRoot'  ${INSTALL_ROOT}/etc/httpsd/httpd.conf  |  cut  -d\"  -f2`
fi                                                                       &&

if  [  "${SPELL_ROOT}"  ==  ""  ];  then
  SPELL_ROOT=/usr/share
fi                                                                       &&
[ -f ${INSTALL_ROOT}${SPELL_ROOT}/${SPELL}/config.inc.php ]              &&
cp  -ruv  ${INSTALL_ROOT}${SPELL_ROOT}/${SPELL}/config.inc.php /tmp      &&

echo  "${SPELL} previous config.inc.php was copied over to /tmp"         

true
