(

  create_accound smmsp

  mkdir -p          /var/spool/mqueue
  chmod 1777        /var/spool/mqueue
  chown smmsp:smmsp /var/spool/mqueue
  mkdir         /usr/doc/sendmail                               
  mkdir         /usr/doc/sendmail/cf                            
  ln -s /var/spool/mqueue /var/spool/mail

  cd cf/cf
  ln -s generic-linux.mc sendmail.mc 				&&
  sh Build sendmail.cf               				&&
  sh Build install-cf                				&&
  cd ../..                           				&&
  sh Build 	                     				&&
  prepare_install                    				&&
  sh Build install                   				&&
  cp -r cf/cf*  /usr/doc/sendmail    				&&
  cp -r contrib /usr/doc/sendmail    				

) > $C_FIFO 2>&1  &&  (

  cp  $SCRIPT_DIRECTORY/sendmail.sh  /etc/init.d
  ln  -sf  ../init.d/sendmail.sh     /etc/rc3.d/S90sendmail
  ln  -sf  ../init.d/sendmail.sh     /etc/rc4.d/S90sendmail
  ln  -sf  ../init.d/sendmail.sh     /etc/rc5.d/S90sendmail

  ln  -sf  ../init.d/sendmail.sh     /etc/rc0.d/K10sendmail
  ln  -sf  ../init.d/sendmail.sh     /etc/rc6.d/K10sendmail

)
