(

  if spell_installed openssl; then
    SSL="--with-ssl=openssl"							&&
    mkdir -p /etc/ssl/certs							&&
    mkdir -p /etc/ssl/private
  else
    SSL=" "
  fi										&&

  PROTOCOLS="none"                                                              &&
  POP3D="none"									&&

  if [ "$IMAP_BOOT" == "y" ]; then
    PROTOCOLS="imap"
  fi                                                                            &&
  if [ "$IMAPS_BOOT" == "y" ]; then
    PROTOCOLS="$PROTOCOLS imaps"
  fi                                                                            &&
  if [ "$POP3_BOOT" == "y" ]; then
    PROTOCOLS="$PROTOCOLS pop3"							&&
    POP3D="--with-pop3d"
  fi                                                                            &&
  if [ "$POP3S_BOOT" == "y" ]; then
    PROTOCOLS="$PROTOCOLS pop3s"						&&
    POP3D="--with-pop3d"
  fi                                                                            &&

  if [ "$PROTOCOLS" == "none" ]; then
    message "${MESSAGE_COLOR}Error: dovecot must be configured for at least one protocol."	&&
    message "run cast -r -c dovecot again. ${DEFAULT_COLOR}"					&&
    return 1
  else
    message "${MESSAGE_COLOR}Using protocols: $PROTOCOLS ${DEFAULT_COLOR}"
  fi										&&

  if [ "$POP3D" == "none" ]; then
    POP3D="--without-pop3d"
  fi										&&

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var 		\
              $IPV6 $SSL $POP3D $OPTS	 					&&
  make										&&

  prepare_install								&&

  make install								        &&

  cp dovecot-example.conf /etc							&&
  mkdir -p /usr/doc/$SPELL							&&
  cp doc/* /usr/doc/$SPELL/							&&	 
  cp /usr/doc/$SPELL/dovecot-openssl.cnf /etc/dovecot-openssl-example.cnf	&&
  cp $SCRIPT_DIRECTORY/dovecot-mkcert.sh /usr/sbin				&&

  sedit "s:#protocols = imap imaps:protocols = $PROTOCOLS:" /etc/dovecot-example.conf &&
  sedit "s:#imap_listen:imap_listen:" /etc/dovecot-example.conf			&&
  sedit "s:#pop3_listen:pop3_listen:" /etc/dovecot-example.conf			&&
  sedit "s:#ssl_cert_file = /etc/ssl/certs/dovecot.pem:ssl_cert_file = /etc/ssl/certs/imapd.pem:" /etc/dovecot-example.conf &&
  sedit "s:#ssl_key_file = /etc/ssl/private/dovecot.pem:ssl_key_file = /etc/ssl/private/imapd.pem:" /etc/dovecot-example.conf &&
  sedit "s:#ssl_disable = no:ssl_disable = no:" /etc/dovecot-example.conf	&&
  sedit "s:#disable_plaintext_auth = no:disable_plaintext_auth = no:" /etc/dovecot-example.conf &&
  sedit "s:#login_executable = /usr/libexec/dovecot/imap-login:login_executable = /usr/libexec/dovecot/imap-login:" /etc/dovecot-example.conf &&
  sedit "s:#login_user = dovecot:login_user = mail:" /etc/dovecot-example.conf &&
  sedit "s:#login_chroot = yes:login_chroot = yes:" /etc/dovecot-example.conf	&&
  sedit "s:#login_executable = /usr/libexec/dovecot/pop3-login:login_executable = /usr/libexec/dovecot/pop3-login:" /etc/dovecot-example.conf &&
  sedit "s:auth_passdb = pam:auth_passdb = shadow:" /etc/dovecot-example.conf	&&
  sedit "s;#default_mail_env =;default_mail_env = mbox:/var/spool/mail/%u;" /etc/dovecot-example.conf &&
  sedit "s:auth = default:auth = shadow:" /etc/dovecot-example.conf 		&&
  sedit "s:#log_path =:log_path = /var/log/dovecot/dovecot.log:" /etc/dovecot-example.conf &&
  sedit "s:#info_log_path =:info_log_path = /var/log/dovecot/dovecot.info:" /etc/dovecot-example.conf &&
  sedit "s:#client_workarounds =:client_workarounds = oe6-fetch-no-newmail outlook-idle:" /etc/dovecot-example.conf &&

  HOSTNAME=`hostname`							  &&
  
  sedit "s:example.com:$HOSTNAME:" /etc/dovecot-openssl-example.cnf		&&

  if [ -e /etc/init.d/dovecot.sh ]; then
    CUR_DATE=`date +%y.%m.%d-%H.%M.%S`						&&
    mv /etc/init.d/dovecot.sh /etc/init.d/dovecot.sh-$CUR_DATE
  fi										

) > $C_FIFO 2>&1 
