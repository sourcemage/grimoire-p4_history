(

  rm -f /usr/share/httpd/htdocs/squirrelmail/doc 
  rm -fr /usr/doc/squirrelmail
  prepare_install   
  mkdir -p /usr/share/httpd/htdocs/$SPELL
  cp    -a $SPELL-$VERSION/* /usr/share/httpd/htdocs/$SPELL
  chown -R nobody  /usr/share/httpd/htdocs/$SPELL
  chgrp -R nogroup /usr/share/httpd/htdocs/$SPELL

) > $C_FIFO 2>&1  

