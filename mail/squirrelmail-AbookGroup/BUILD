(
  if  spell_installed  "apache";  then
    LOC="/usr/share/httpd/htdocs/squirrelmail/plugins/"
  elif  spell_installed  "apache2";  then
    LOC="/usr/share/apache2/htdocs/squirrelmail/plugins/"
  fi

  cd ..                                   &&
  chown  -R  nobody.nogroup  abook_group  &&
  prepare_install                         &&
  mv  abook_group  $LOC
  
) > $C_FIFO 2>&1
