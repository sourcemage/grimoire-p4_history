(

  create_account smmsp						&&

  mkdir -p          /var/spool/mqueue				&&
  mkdir -p          /etc/mail 					&&
  chmod 1777        /var/spool/mqueue				&&
  chown smmsp:smmsp /var/spool/mqueue				&&
  mkdir -p          /usr/doc/sendmail                           &&  
  mkdir -p          /usr/doc/sendmail/cf                        &&  
  ln -s /var/spool/mqueue /var/spool/mail || true		&&

  make all							&&
  cd cf/cf							&&
  ln -s generic-linux.mc sendmail.mc 				&&
  make all 		               				&&

  prepare_install                    				&&

  make install-cf						&&
  cd ../..
  make install                   				&&

  cp -r cf        /usr/doc/sendmail                             &&
  cp -r devtools  /usr/doc/sendmail                             &&
  cp -r contrib   /usr/doc/sendmail                                         

) > $C_FIFO 2>&1
