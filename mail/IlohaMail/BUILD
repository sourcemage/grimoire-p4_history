(

  # apache htdoc path auto detection
  if  spell_installed    "apache";   then
    LOC="/usr/share/httpd/htdocs/$SPELL"
  elif  spell_installed  "apache-mod_ssl";  then
    LOC="/usr/share/httpsd/htdocs/$SPELL"
  elif  spell_installed  "apache2";  then
    LOC="/usr/share/apache2/htdocs/$SPELL"
  fi								&&

  if [ "$LOC" == "" ]; then
    message "${MESSAGE_COLOR}Unable to find apache or apache2 installed version..."	&&
    message "$SPELL cast aborded. ${DEFAULT_COLOR}"					&&
    return 1
  fi								&&


  prepare_install 						&&

  mkdir -p $LOC							&&

  mkdir -p $LOC/users 						&&
  mkdir -p $LOC/sessions 					&&
  mkdir -p $LOC/uploads 					&&
  mkdir -p $LOC/cache 						&&

  cp -r IlohaMail/* $LOC                                	&&

  chmod 700 $LOC/users $LOC/sessions $LOC/uploads $LOC/cache	&&
  chown  www-data.www-data  -R  $LOC  				&&

  # Copy software Documentation
  mkdir -p /usr/doc/$SPELL					&&
  cp -r Manual /usr/doc/$SPELL					&&
  cp COPYING INSTALL README RELEASE_NOTES UPGRADING /usr/doc/$SPELL

) > $C_FIFO 2>&1
