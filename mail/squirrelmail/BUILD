(

  if  spell_installed    "apache";   then
    LOC="/usr/share/httpd/htdocs/$SPELL"
  elif  spell_installed  "apache2";  then
    LOC="/usr/share/apache2/htdocs/$SPELL"
  fi

  rm -fr $LOC/doc 
  rm -fr /usr/doc/$SPELL
  prepare_install   
  mkdir -p $LOC
  cp    -a $SPELL-$VERSION/* $LOC
  chown -R nobody  $LOC
  chgrp -R nogroup $LOC

) > $C_FIFO 2>&1  

