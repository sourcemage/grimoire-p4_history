(
  create_account postfix      
  create_account postdrop     
  create_account mail         
 
  mkdir  -p         ${INSTALL_ROOT}/var/spool/mail                                      &&
  chmod  1777       ${INSTALL_ROOT}/var/spool/mail                                      &&
  chown  mail:mail  ${INSTALL_ROOT}/var/spool/mail                                      &&
  chgrp  mail       ${INSTALL_ROOT}/var/spool/mail/*                                    && 

  if  spell_installed  openldap && [ "$LDAP" == "y" ]
  then AUXLIBS="-lldap -llber"                                                          &&
       CCARGS="-DHAS_LDAP"                                                              &&
       message "${MESSAGE_COLOR}Openldap detected: Using Openldap ${DEFAULT_COLOR}"
  fi											&&

  if  spell_installed  Linux-PAM && [ "$PAM" == "y" ]
  then AUXLIBS="$AUXLIBS -lpam -lpam_misc"                                              &&
       CCARGS="$CCARGS  -DHAS_PAM"                                                      &&
       message "${MESSAGE_COLOR}Linux-Pam detected: Using Linux-PAM ${DEFAULT_COLOR}"
  fi                                                                                    &&

  if  spell_installed  cyrus-sasl && [ "$SASL" == "y" ]
  then AUXLIBS="$AUXLIBS -lsasl2"                                                       &&
       CCARGS="$CCARGS  -DUSE_SASL_AUTH -I/usr/include/sasl"                            &&
       message "${MESSAGE_COLOR}Cyrus-sasl detected: Using Cyrus-sasl ${DEFAULT_COLOR}"
  fi                                                                                    &&

  if spell_installed mysql && [ "$MYSQL" == "y" ]
  then AUXLIBS="$AUXLIBS -L/usr/lib -lmysqlclient -lz -lm"                              &&
       CCARGS="$CCARGS -DHAS_MYSQL -I/usr/include/mysql"                                &&
       message "${MESSAGE_COLOR}MySQL detected: Using MySQL ${DEFAULT_COLOR}"
  fi                                                                                    &&

  if  spell_installed  openssl && [ "$SSL" == "y" ]
  then AUXLIBS="$AUXLIBS -lssl -lcrypto"                                                &&
      CCARGS="$CCARGS -DHAS_SSL -I/usr/include/openssl"                                 &&
      message "${MESSAGE_COLOR}OpenSSL detected: Using OpenSSL ${DEFAULT_COLOR}"
  fi                                                                                    &&

  case $SSL_TLS in
    y|Y)	
      message "${MESSAGE_COLOR}Trying to patch Postfix for SSL/TLS support ${DEFAULT_COLOR}" &&
      patch -Np1 < $SOURCE2_DIRECTORY/pfixtls.diff  || PATCH_FAILED=true                &&
      if [ "$PATCH_FAILED" == "true" ]; then
        message "${MESSAGE_COLOR}Patch failed... please do a cast -r -c postfix"        &&
	message "and answer no to the TLS/SSL patch question. ${DEFAULT_COLOR}"         &&
        exit 1
      fi
  esac                                                                                  &&

  case $PGSQL in
    y|Y)	
      message "${MESSAGE_COLOR}Trying to patch Postfix for PostgreSQL support ${DEFAULT_COLOR}" &&
      patch -Np1 < $SOURCE3_DIRECTORY/$SOURCE3  || PATCH_FAILED=true                    &&
      if [ "$PATCH_FAILED" == "true" ]; then
        message "${MESSAGE_COLOR}Patch failed... please do a cast -r -c postfix"        &&
	message "and answer no to the Postgresql patch question. ${DEFAULT_COLOR}"      &&
        exit 1
      fi                                                                                &&
      AUXLIBS="$AUXLIBS /usr/lib/libpq.a -lcrypt"                                       &&
      CCARGS="$CCARGS  -DHAS_PGSQL -I/usr/include/postgresql"                           &&
      mkdir -p ${INSTALL_ROOT}/usr/doc/$SPELL                                           &&
      mkdir -p ${INSTALL_ROOT}/usr/doc/$SPELL/$NAME4                                    &&
      cp -r $SOURCE4_DIRECTORY/$NAME4/* ${INSTALL_ROOT}/usr/doc/$SPELL/$NAME4
  esac                                                                                  &&

  case $VDA in
    y|Y)	
      message "${MESSAGE_COLOR}Trying to patch Postfix with VDA support ${DEFAULT_COLOR}" &&
      patch -Np1 < $SOURCE5_DIRECTORY/$NAME5   || PATCH_FAILED=true                     &&
      if [ "$PATCH_FAILED" == "true" ]; then
        message "${MESSAGE_COLOR}Patch failed... please do a cast -r -c postfix"        &&
	message "and answer no to the VDA patch question. ${DEFAULT_COLOR}"             &&
        exit 1
      fi
  esac                                                                                  &&

  # fix to get man pages to install in /usr/man

  sedit  "s:/usr/local:${INSTALL_ROOT}/usr:"  src/global/mail_params.h                  &&

  # NPTL glibc fix
  if /lib/libc.so.6 | grep -q NPTL; then
    AUXLIBS="$AUXLIBS -lpthread"
  fi                                                                                    &&

  make makefiles                \
	"CC=gcc"                \
        "OPT=$CFLAGS"           \
        "AUXLIBS=$AUXLIBS"      \
        "CCARGS=$CCARGS"                                                                &&
  make                                                                                  &&
  prepare_install                                                                       &&
  if [ -d ${INSTALL_ROOT}/etc/postfix ]; then
    make upgrade               				
  else
    make install
  fi                                                                                    &&
  ln  -sf  ../sbin/sendmail   ${INSTALL_ROOT}/usr/lib/sendmail                          &&
  ln  -sf  postfix/aliases    ${INSTALL_ROOT}/etc/aliases                               &&

  if [ "$BENCH" == "y" ]; then
    chmod 544 	src/smtpstone/qmqp-source \
		src/smtpstone/smtp-sink   \
		src/smtpstone/smtp-source                                               &&
    cp src/smtpstone/qmqp-source ${INSTALL_ROOT}/usr/sbin                               &&
    cp src/smtpstone/smtp-sink   ${INSTALL_ROOT}/usr/sbin                               &&
    cp src/smtpstone/smtp-source ${INSTALL_ROOT}/usr/sbin		
  fi                                                                                    &&
  mkdir -p ${INSTALL_ROOT}/usr/doc/$SPELL                                               &&
  cp -rf README_FILES ${INSTALL_ROOT}/usr/doc/$SPELL/                                   &&
  cp -f INSTALL ${INSTALL_ROOT}/usr/doc/$SPELL/README_FILES                             &&
  cp -f RELEASE_NOTES ${INSTALL_ROOT}/usr/doc/$SPELL/README_FILES                       &&
  cp -rf html ${INSTALL_ROOT}/usr/doc/$SPELL/

) > $C_FIFO 2>&1  &&  (

  sedit  "s:#mail_spool_directory = /var/spool/mail:mail_spool_directory = ${INSTALL_ROOT}/var/spool/mail:"  \
         ${INSTALL_ROOT}/etc/postfix/main.cf

  sedit  "s|#alias_maps = hash:/etc/aliases$|alias_maps = hash:${INSTALL_ROOT}/etc/aliases|"  \
         ${INSTALL_ROOT}/etc/postfix/main.cf

)
