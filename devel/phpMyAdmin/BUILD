(

  echo  "Locating your Web server..."

  for  SPELL_TEST  in  `find_providers  webserver`;  do
    if  spell_installed  ${SPELL_TEST};  then
      HTTPD_CONF_LOC=`gaze  install  ${SPELL_TEST}  |  grep  'httpd.conf$'`
      DOC_ROOT=`grep  '^DocumentRoot'  ${HTTPD_CONF_LOC}  |  cut  -d\"  -f2`
    fi
  done

  cd  ${SOURCE_DIRECTORY}             &&
  prepare_install                     &&
  mkdir  -p  ${DOC_ROOT}/phpMyAdmin   &&
  cp  -r  *  ${DOC_ROOT}/phpMyAdmin/

) > $C_FIFO 2>&1
