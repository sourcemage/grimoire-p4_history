(
# apache/apache2 auto setup
if  spell_installed  "apache";     then
# location to httpd root doc dir
  LOC="/usr/share/httpd"
# same, but to be used withing search/replace regexp
  SLOC="\/usr\/share\/httpd\/htdocs"
elif  spell_installed  "apache-mod_ssl";  then
  LOC="/usr/share/httpsd"
  SLOC="\/usr\/share\/httpsd\/htdocs"
elif  spell_installed  "apache2";  then
  LOC="/usr/share/apache2"
  SLOC="\/usr\/share\/apache2"
fi

prepare_install

# move docs
mkdir /usr/doc/openwebmail 1>/dev/null 2>&1
cp -r ./data/openwebmail/doc/* /usr/doc/openwebmail 1>/dev/null 2>&1
rm -r -f ./data/openwebmail/doc

# check for previous config file
if [ -e /etc/openwebmail.conf ]; then
 message " "
 message "${MESSAGE_COLOR}Previous config file detected..."
 message "The new sample config file will be named openwebmail-new.conf."
 message "Your actual config is maintained (beware of conf file format changes).${DEFAULT_COLOR}"
 message " "

 mv ./cgi-bin/openwebmail/etc/openwebmail.conf /etc/openwebmail-new.conf  1>/dev/null 2>&1
else
 mv ./cgi-bin/openwebmail/etc/openwebmail.conf /etc/openwebmail.conf 1>/dev/null 2>&1
fi

# move http and bin

cp -r ./cgi-bin/* $LOC/cgi-bin/ 1>/dev/null 2>&1
cp -r ./data/* $LOC/htdocs/ 1>/dev/null 2>&1

ln -s /etc/openwebmail.conf $LOC/cgi-bin/openwebmail/etc/openwebmail.conf 1>/dev/null 2>&1

# Security team'll shoot me...
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail.pl 	 	1>/dev/null 2>&1
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail-main.pl  	1>/dev/null 2>&1
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail-prefs.pl 	1>/dev/null 2>&1
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail-read.pl		1>/dev/null 2>&1	
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail-viewatt.pl	1>/dev/null 2>&1
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail-send.pl		1>/dev/null 2>&1
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail-spell.pl	1>/dev/null 2>&1
chmod 4555 $LOC/cgi-bin/openwebmail/checkmail.pl		1>/dev/null 2>&1
chmod 775       $LOC/cgi-bin/openwebmail/etc/sessions		1>/dev/null 2>&1
chown root.mail $LOC/cgi-bin/openwebmail/etc/sessions		1>/dev/null 2>&1

touch                /var/log/openwebmail.log 1>/dev/null 2>&1
chown nobody.nogroup /var/log/openwebmail.log
chmod 660            /var/log/openwebmail.log

# At this time, I have no clue about PAM support for Perl... fallback to unix auth
#echo "auth       required     /lib/security/pam_unix.so" > /etc/pam.d/openwebmail
#echo "account    required     /lib/security/pam_unix.so">> /etc/pam.d/openwebmail
#echo "password   required     /lib/security/pam_unix.so">> /etc/pam.d/openwebmail

sedit "s/\/etc\/master.passwd/\/etc\/shadow/" $LOC/cgi-bin/openwebmail/auth_unix.pl
sedit "s/\/usr\/sbin\/pwd_mkdb/none/" $LOC/cgi-bin/openwebmail/auth_unix.pl

# Tune OWM defaults to SMGL style
sedit "s/\/var\/mail/\/var\/spool\/mail/" $LOC/cgi-bin/openwebmail/etc/openwebmail.conf
sedit "s/\/usr\/local\/www\/data\/openwebmail/$SLOC\/htdocs\/openwebmail/" $LOC/cgi-bin/openwebmail/etc/openwebmail.conf
sedit "s/\/usr\/local\/www\/cgi-bin\/openwebmail/$SLOC\/cgi-bin\/openwebmail/" $LOC/cgi-bin/openwebmail/etc/openwebmail.conf

# This is for future use of perl+PAM
#echo "auth       required     /lib/security/pam_unix.so" > /etc/pam.d/openwebmail
#echo "account    required     /lib/security/pam_unix.so">> /etc/pam.d/openwebmail
#echo "password   required     /lib/security/pam_unix.so">> /etc/pam.d/openwebmail

# Initialize openwebmail
if [ "$MAIL_STATS" == "n" ]; then
  message "${MESSAGE_COLOR}Patching OpenWebmail init file to skip email report...${DEFAULT_COLOR}"
  patch --verbose $LOC/cgi-bin/openwebmail/openwebmail-tool.pl < $SCRIPT_DIRECTORY/openwebmail-tool.pl.patch
fi

message "${MESSAGE_COLOR}Initializing OpenWebmail${DEFAULT_COLOR}"
$LOC/cgi-bin/openwebmail/openwebmail-tool.pl --init

) > $C_FIFO 2>&1  
