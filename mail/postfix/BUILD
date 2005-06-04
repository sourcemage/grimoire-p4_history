create_account  postfix   &&
create_account  postdrop  &&
create_account  mail      &&
 
mkdir  -p         $INSTALL_ROOT/var/spool/mail  &&
chmod  1777       $INSTALL_ROOT/var/spool/mail  &&
chown  mail:mail  $INSTALL_ROOT/var/spool/mail  &&
chgrp  -R  mail   $INSTALL_ROOT/var/spool/mail  &&

if  [  "$POSTFIX_LDAP"  ==  "y"  ];  then
  AUXLIBS="-lldap -llber"  &&
  CCARGS="-DHAS_LDAP"      &&
  message "${MESSAGE_COLOR}Openldap detected: Using OpenLDAP${DEFAULT_COLOR}"
fi  &&

if  [  "$POSTFIX_PAM"  ==  "y"  ];  then
  AUXLIBS="$AUXLIBS -lpam -lpam_misc"  &&
  CCARGS="$CCARGS  -DHAS_PAM"          &&
  message "${MESSAGE_COLOR}Linux-Pam detected: Using linux-pam${DEFAULT_COLOR}"
fi  &&

if  [  "$POSTFIX_SASL"  ==  "y"  ];  then
  AUXLIBS="$AUXLIBS -lsasl2"                             &&
  CCARGS="$CCARGS  -DUSE_SASL_AUTH -I/usr/include/sasl"  &&
  message "${MESSAGE_COLOR}Cyrus-sasl detected: Using Cyrus-SASL${DEFAULT_COLOR}"
fi  &&

if  [  "$POSTFIX_MYSQL"  ==  "y"  ];  then
  AUXLIBS="$AUXLIBS -L/usr/lib -lmysqlclient -lz -lm"  &&
  CCARGS="$CCARGS -DHAS_MYSQL -I/usr/include/mysql"    &&
  message "${MESSAGE_COLOR}MySQL detected: Using MySQL ${DEFAULT_COLOR}"
fi  &&

if  [  "$POSTFIX_SSL"  ==  "y"  ];  then
  AUXLIBS="$AUXLIBS -lssl -lcrypto"  &&
  CCARGS="$CCARGS -DUSE_TLS"         &&
  message "${MESSAGE_COLOR}OpenSSL detected: Using OpenSSL ${DEFAULT_COLOR}"
fi  &&

if  [  "$POSTFIX_VDA"  ==  "y"  ];  then
    message "${MESSAGE_COLOR}Trying to patch Postfix with VDA support${DEFAULT_COLOR}"  &&
    patch -Np1 < $SOURCE2_DIRECTORY/$NAME2   || PATCH_FAILED=true  &&
    if [ "$PATCH_FAILED" == "true" ]; then
      message "${MESSAGE_COLOR}Patch failed... please do a cast -r -c postfix"  &&
      message "and answer no to the VDA patch question.${DEFAULT_COLOR}"  &&
      return 1
    fi
fi   &&

# fix to get man pages to install in /usr/share/man

sedit  "s:/usr/local:${INSTALL_ROOT}/usr/share:"  src/global/mail_params.h  &&

# NPTL glibc fix
if  glibc_is_nptl; then
  AUXLIBS="$AUXLIBS  -lpthread"
fi  &&

make  makefiles           \
      "CC=gcc"            \
      "OPT=$CFLAGS"       \
      "AUXLIBS=$AUXLIBS"  \
      "CCARGS=$CCARGS"    &&
make
