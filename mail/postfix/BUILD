(

  create_account postfix
  create_account postdrop
  create_account mail
 
  mkdir  -p         /var/spool/mail
  chmod  1777       /var/spool/mail			&&
  chown  mail:mail  /var/spool/mail			&&
  chgrp  mail       /var/spool/mail/*			&&

  if  spell_installed  openldap
  then  AUXLIBS="-lldap -llber"				&&
         CCARGS="-DHAS_LDAP"
  fi							&&

  if  spell_installed  Linux-PAM
  then  AUXLIBS="$AUXLIBS -lpam -lpam_misc"		&&
         CCARGS="$CCARGS  -DHAS_PAM"
  fi							&&

  # fix to get man pages to install in /usr/man

  sedit  "s:/usr/local:/usr:"  src/global/mail_params.h	&&

  make -f Makefile.init makefiles	   		&&

  make  "CC=gcc"               \
        "OPT=$CFLAGS"          \
        "AUXLIBS=$AUXLIBS"     \
        "CCARGS=CCARGS"        				&&

  prepare_install              				&&

  if [ -e /etc/postfix/main.cf ]; then
    make upgrade               				
  else
    make install	       				
  fi			       				&&

  ln  -sf  ../sbin/sendmail   /usr/lib/sendmail  	&&

  ln  -sf  postfix/aliases    /etc/aliases		&&

  if [ "$BENCH" == "y" ]; then
    chmod 544 	src/smtpstone/qmqp-source \
		src/smtpstone/smtp-sink   \
		src/smtpstone/smtp-source		&&
    cp src/smtpstone/qmqp-source /usr/sbin		&&
    cp src/smtpstone/smtp-sink   /usr/sbin		&&
    cp src/smtpstone/smtp-source /usr/sbin		
  fi							&&
 
  mkdir /usr/doc/$SPELL 1>/dev/null 2>&1 || true	&&
  cp -r README_FILES /usr/doc/$SPELL/			&&
  cp -r html /usr/doc/$SPELL/

) > $C_FIFO 2>&1  &&  (

# Startup script may have been modified by the administrator
# So it would survive removal of the previous spell
# We don't want to overwrite it in this case
  [ -x /etc/init.d/postfix.sh ] || cp  $SCRIPT_DIRECTORY/postfix.sh  /etc/init.d

  ln  -sf  ../init.d/postfix.sh     /etc/rc3.d/S90postfix
  ln  -sf  ../init.d/postfix.sh     /etc/rc4.d/S90postfix
  ln  -sf  ../init.d/postfix.sh     /etc/rc5.d/S90postfix

  ln  -sf  ../init.d/postfix.sh     /etc/rc0.d/K10postfix
  ln  -sf  ../init.d/postfix.sh     /etc/rc6.d/K10postfix

  sedit  "s:#mail_spool_directory = /var/spool/mail:mail_spool_directory = /var/spool/mail:"  \
         /etc/postfix/main.cf

  sedit  "s|#alias_maps = hash:/etc/aliases$|alias_maps = hash:/etc/aliases|"  \
         /etc/postfix/main.cf

)
