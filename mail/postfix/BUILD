(

  create_account postfix
  create_account postdrop
  create_account mail
 
  mkdir  -p         /var/spool/mail
  chmod  1777       /var/spool/mail							&&
  chown  mail:mail  /var/spool/mail							&&
  chgrp  mail       /var/spool/mail/*							&&

  if  spell_installed  openldap
  then
    if [ "$LDAP" == "y" ]; then
      AUXLIBS="-lldap -llber"								&&
      CCARGS="-DHAS_LDAP"								&&
      message "${MESSAGE_COLOR}Openldap detected: Using Openldap ${DEFAULT_COLOR}"
    fi
  fi											&&

  if  spell_installed  Linux-PAM
  then
    if [ "$PAM" == "y" ]; then
      AUXLIBS="$AUXLIBS -lpam -lpam_misc"						&&
      CCARGS="$CCARGS  -DHAS_PAM"							&&
      message "${MESSAGE_COLOR}Linux-Pam detected: Using Linux-PAM ${DEFAULT_COLOR}"
    fi
  fi											&&

  if  spell_installed  cyrus-sasl
  then
    if [ "$SASL" == "y" ]; then
      AUXLIBS="$AUXLIBS -lsasl2"							&&
      CCARGS="$CCARGS  -DUSE_SASL_AUTH"							&&
      message "${MESSAGE_COLOR}Cyrus-sasl detected: Using Cyrus-sasl ${DEFAULT_COLOR}"
    fi
  fi                                                    				&&

  if spell_installed mysql
  then
    if [ "$MYSQL" == "y" ]; then  
      AUXLIBS="$AUXLIBS -L/usr/lib -lmysqlclient -lz -lm"     				&&
      CCARGS="$CCARGS -DHAS_MYSQL -I/usr/include/mysql"      				&&
      message "${MESSAGE_COLOR}MySQL detected: Using MySQL ${DEFAULT_COLOR}"
    fi
  fi  					                                                &&

  if  spell_installed  openssl
  then  
    if [ "$SSL" == "y" ]; then
      AUXLIBS="$AUXLIBS -lssl -lcrypto"               			   	   	&&
      CCARGS="$CCARGS -DHAS_SSL -I/usr/include/openssl"       		   		&&
      message "${MESSAGE_COLOR}OpenSSL detected: Using OpenSSL ${DEFAULT_COLOR}"
    fi
  fi                                                    				&&

  case $SSL_TLS in
    y|Y|j|J)	
      message "${MESSAGE_COLOR}Trying to patch Postfix for SSL/TLS support ${DEFAULT_COLOR}" &&
      patch -p1 < $SOURCE2_DIRECTORY/pfixtls.diff  || PATCH_FAILED=true		&&
      if [ "$PATCH_FAILED" == "true" ]; then
        message "${MESSAGE_COLOR}Patch failed... please do a cast -r -c postfix"	&&
	message "and answer no to the TLS/SSL patch question. ${DEFAULT_COLOR}"
        exit 1
      fi
  esac                                                    				&&

  # fix to get man pages to install in /usr/man

  sedit  "s:/usr/local:/usr:"  src/global/mail_params.h					&&

  make makefiles 			   						&&

  make  "CC=gcc"               \
        "OPT=$CFLAGS"          \
        "AUXLIBS=$AUXLIBS"     \
        "CCARGS=$CCARGS"       								&&

  prepare_install              								&&

  if [ -d /etc/postfix ]; then
    make upgrade               				
  else
    make install	       				
  fi			       								&&

  ln  -sf  ../sbin/sendmail   /usr/lib/sendmail  					&&

  ln  -sf  postfix/aliases    /etc/aliases						&&

  if [ "$BENCH" == "y" ]; then
    chmod 544 	src/smtpstone/qmqp-source \
		src/smtpstone/smtp-sink   \
		src/smtpstone/smtp-source						&&
    cp src/smtpstone/qmqp-source /usr/sbin						&&
    cp src/smtpstone/smtp-sink   /usr/sbin						&&
    cp src/smtpstone/smtp-source /usr/sbin		
  fi											&&
 
  mkdir /usr/doc/$SPELL 1>/dev/null 2>&1 || true					&&
  cp -r README_FILES /usr/doc/$SPELL/							&&
  cp INSTALL /usr/doc/$SPELL/README_FILES						&&
  cp RELEASE_NOTES /usr/doc/$SPELL/README_FILES						&&
  cp -r html /usr/doc/$SPELL/

) > $C_FIFO 2>&1  &&  (

  sedit  "s:#mail_spool_directory = /var/spool/mail:mail_spool_directory = /var/spool/mail:"  \
         /etc/postfix/main.cf

  sedit  "s|#alias_maps = hash:/etc/aliases$|alias_maps = hash:/etc/aliases|"  \
         /etc/postfix/main.cf

)
