(
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
cp -r ./cgi-bin/* /usr/share/httpd/cgi-bin/ 1>/dev/null 2>&1
cp -r ./data/* /usr/share/httpd/htdocs/ 1>/dev/null 2>&1

ln -s /etc/openwebmail.conf /usr/share/httpd/cgi-bin/openwebmail/etc/openwebmail.conf 1>/dev/null 2>&1

# Security team'll shoot me...
chmod 4555 /usr/share/httpd/cgi-bin/openwebmail/openwebmail.pl 		1>/dev/null 2>&1
chmod 4555 /usr/share/httpd/cgi-bin/openwebmail/openwebmail-main.pl	1>/dev/null 2>&1
chmod 4555 /usr/share/httpd/cgi-bin/openwebmail/openwebmail-prefs.pl	1>/dev/null 2>&1
chmod 4555 /usr/share/httpd/cgi-bin/openwebmail/openwebmail-read.pl	1>/dev/null 2>&1	
chmod 4555 /usr/share/httpd/cgi-bin/openwebmail/openwebmail-viewatt.pl	1>/dev/null 2>&1
chmod 4555 /usr/share/httpd/cgi-bin/openwebmail/openwebmail-send.pl	1>/dev/null 2>&1
chmod 4555 /usr/share/httpd/cgi-bin/openwebmail/openwebmail-spell.pl	1>/dev/null 2>&1
chmod 4555 /usr/share/httpd/cgi-bin/openwebmail/checkmail.pl		1>/dev/null 2>&1
chmod 775       /usr/share/httpd/cgi-bin/openwebmail/etc/sessions	1>/dev/null 2>&1
chown root.mail /usr/share/httpd/cgi-bin/openwebmail/etc/sessions	1>/dev/null 2>&1

touch                /var/log/openwebmail.log 1>/dev/null 2>&1
chown nobody.nogroup /var/log/openwebmail.log
chmod 660            /var/log/openwebmail.log

# At this time, I have no clue about PAM support for Perl... fallback to unix auth
#echo "auth       required     /lib/security/pam_unix.so" > /etc/pam.d/openwebmail
#echo "account    required     /lib/security/pam_unix.so">> /etc/pam.d/openwebmail
#echo "password   required     /lib/security/pam_unix.so">> /etc/pam.d/openwebmail

sedit "s/\/etc\/master.passwd/\/etc\/shadow/" /usr/share/httpd/cgi-bin/openwebmail/auth_unix.pl
sedit "s/\/usr\/sbin\/pwd_mkdb/none/" /usr/share/httpd/cgi-bin/openwebmail/auth_unix.pl

# Tune OWM defaults to SGL style
sedit "s/\/var\/mail/\/var\/spool\/mail/" /usr/share/httpd/cgi-bin/openwebmail/etc/openwebmail.conf
sedit "s/\/usr\/local\/www\/data\/openwebmail/\/usr\/share\/httpd\/htdocs\/openwebmail/" /usr/share/httpd/cgi-bin/openwebmail/etc/openwebmail.conf
sedit "s/\/usr\/local\/www\/cgi-bin\/openwebmail/\/usr\/share\/httpd\/cgi-bin\/openwebmail/" /usr/share/httpd/cgi-bin/openwebmail/etc/openwebmail.conf

# This is for future use of perl+PAM
#echo "auth       required     /lib/security/pam_unix.so" > /etc/pam.d/openwebmail
#echo "account    required     /lib/security/pam_unix.so">> /etc/pam.d/openwebmail
#echo "password   required     /lib/security/pam_unix.so">> /etc/pam.d/openwebmail

# Tune DBMTEST to SMGL style 
message "${MESSAGE_COLOR}This patch turns DBM test off (see HISTORY file)${DEFAULT_COLOR}"
patch /usr/share/httpd/cgi-bin/openwebmail/openwebmail-shared.pl <$SCRIPT_DIRECTORY/openwebmail-shared.pl.patch
message " "

) > $C_FIFO 2>&1  
