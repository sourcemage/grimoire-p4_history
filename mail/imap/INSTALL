(
  case $IMAP_MAILSUBDIR in
  y|Y|j|J)
    patch -p1 < $SCRIPT_DIRECTORY/mailsubdir.patch
  ;;
  *)
    true
  ;;
  esac                                                                   &&

  if spell_ok openssl; then
    if [ "$USE_SSL" == "y" ]; then
      message "${MESSAGE_COLOR}Building with OpenSSL...${DEFAULT_COLOR}" &&
      SSLOPTS="SSLTYPE=unix           \
      SSLCERTS=/etc/ssl/certs         \
      SSLINCLUDE=/usr/include/openssl \
      SSLLIB=/usr/lib		    \
      SSLTYPE=unix"
    else
      message "${MESSAGE_COLOR}Building without OpenSSL...${DEFAULT_COLOR}" &&
      SSLOPTS="SSLTYPE=none"
    fi
  else
    message "${MESSAGE_COLOR}Building without OpenSSL...${DEFAULT_COLOR}" &&
    SSLOPTS="SSLTYPE=none"
  fi                                                                     &&

  if spell_ok linux-pam; then
    message "${MESSAGE_COLOR}Building with PAM...${DEFAULT_COLOR}"     	 &&
    TARGET=lnp
  else
    TARGET=slx
  fi									 &&

  yes | make DEBUG="$CFLAGS" $SSLOPTS $TARGET                            &&

  prepare_install						         &&

  #
  # Install c-cient
  #
  mkdir  -p                         /usr/include/imap			 &&
  cp     -f  ./c-client/*.h         /usr/include/imap/			 &&
  cp     -f  ./c-client/c-client.a  /usr/lib/libc-client.a		 &&

  cp  -f  ./imapd/imapd   /usr/sbin/					 &&
  cp  -f  ./ipopd/ipop2d  /usr/sbin/					 &&
  cp  -f  ./ipopd/ipop3d  /usr/sbin/					 &&
  cp  -f  ./mtest/mtest   /usr/bin/					 &&

  if  spell_ok  stunnel;  then
    ln  -sf  /etc/stunnel/stunnel.pem   \
             /etc/ssl/certs/imapd.pem   &&
    ln  -sf  /etc/stunnel/stunnel.pem   \
             /etc/ssl/certs/ipop3d.pem
  fi									 &&

  message "${MESSAGE_COLOR}If you get 'unknown AUTHORIZATION state command'"  	&&
  message "Then you probably want to edit /etc/xinetd.d/imapd-stunnel"        	&&
  message "and use imap without stunnel encapsulation... ${DEFAULT_COLOR}"

) > $C_FIFO 2>&1
