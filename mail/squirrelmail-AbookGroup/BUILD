(

  if  spell_installed    "apache";   then
    LOC="/usr/share/httpd/htdocs/squirrelmail/plugins/"
  elif  spell_installed  "apache-mod_ssl";  then
    LOC="/usr/share/httpsd/htdocs/squirrelmail/plugins/"
  elif  spell_installed  "apache2";  then
    LOC="/usr/share/apache2/htdocs/squirrelmail/plugins/"
  fi					  &&

  if [ "$LOC" == "" ]; then
    message "${MESSAGE_COLOR}Unable to find apache or apache2 installed version..."
    message "$SPELL cast aborded. ${DEFAULT_COLOR}"
    return 1
  fi					  &&

  cd ..                                   &&
  chown  -R  nobody.nogroup  abook_group  &&
  prepare_install                         &&
  mv  abook_group  $LOC
  
) > $C_FIFO 2>&1
