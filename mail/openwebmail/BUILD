(

# apache/apache2 auto setup
if  spell_installed  "apache";  then
# location to httpd root doc dir
  LOC="/usr/share/httpd"									&&
# same, but to be used withing search/replace regexp
  SLOC="\/usr\/share\/httpd\/htdocs"
elif  spell_installed  "apache-mod_ssl";  then
  LOC="/usr/share/httpsd"									&&
  SLOC="\/usr\/share\/httpsd\/htdocs"
elif  spell_installed  "apache2";  then
  LOC="/usr/share/apache2"									&&
  SLOC="\/usr\/share\/apache2"
fi												&&

prepare_install											&&
			
# move docs
mkdir -p /usr/doc/openwebmail 1>/dev/null 2>&1							&&
cp -r ./data/openwebmail/doc/* /usr/doc/openwebmail 1>/dev/null 2>&1 				&&
rm -r -f ./data/openwebmail/doc									&&

# check for previous config file
if [ -e /etc/openwebmail.conf ]; then
 message " "											&&
 message "${MESSAGE_COLOR}Previous config file detected..."					&&
 message "The new sample config file will be named openwebmail-new.conf." 			&&
 message "Your actual config is maintained (beware of conf file format changes)."		&&
 message " ${DEFAULT_COLOR}" 									&&

 mv ./cgi-bin/openwebmail/etc/openwebmail.conf /etc/openwebmail-new.conf  1>/dev/null 2>&1 
else
 mv ./cgi-bin/openwebmail/etc/openwebmail.conf /etc/openwebmail.conf 1>/dev/null 2>&1
fi												&&

# move http and bin
cp -r ./cgi-bin/* $LOC/cgi-bin/ 1>/dev/null 2>&1						&&
cp -r ./data/* $LOC/htdocs/ 1>/dev/null 2>&1							&&

ln -s /etc/openwebmail.conf $LOC/cgi-bin/openwebmail/etc/openwebmail.conf 1>/dev/null 2>&1	&&

# Security team'll shoot me...
message "${MESSAGE_COLOR}Setting up rights... ${DEFAULT_COLOR}"					&&
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail.pl 	 					&&
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail-main.pl  					&&
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail-prefs.pl  					&&
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail-read.pl						&&
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail-viewatt.pl					&&
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail-send.pl						&&
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail-spell.pl					&&
chmod 4555 $LOC/cgi-bin/openwebmail/openwebmail-tool.pl						&&
chmod 775       $LOC/cgi-bin/openwebmail/etc/sessions  						&&
chown root.mail $LOC/cgi-bin/openwebmail/etc/sessions  						&&

message "${MESSAGE_COLOR}Setting up log... ${DEFAULT_COLOR}" 					&&
[ -x /var/log/openwebmail.log ] || touch /var/log/openwebmail.log 1>/dev/null 2>&1		&&
chown nobody.nogroup /var/log/openwebmail.log							&&
chmod 660            /var/log/openwebmail.log							&&

# At this time, I have no clue about PAM support for Perl... fallback to unix auth
#echo "auth       required     /lib/security/pam_unix.so" > /etc/pam.d/openwebmail		&&
#echo "account    required     /lib/security/pam_unix.so">> /etc/pam.d/openwebmail		&&
#echo "password   required     /lib/security/pam_unix.so">> /etc/pam.d/openwebmail		&&

# This is for future use of perl+PAM
#echo "auth       required     /lib/security/pam_unix.so" > /etc/pam.d/openwebmail		&&
#echo "account    required     /lib/security/pam_unix.so">> /etc/pam.d/openwebmail		&&
#echo "password   required     /lib/security/pam_unix.so">> /etc/pam.d/openwebmail		&&

#
# apply a patch to avoid DB error
#
patch $LOC/cgi-bin/openwebmail/openwebmail-tool.pl < $SCRIPT_DIRECTORY/openwebmail-tool.pl-DB.patch &&

# Initialize openwebmail
if [ "$MAIL_STATS" == "n" ]; then
  MAIL_OPT="--no"
else
  MAIL_OPT="--yes"
fi												&&

message "${MESSAGE_COLOR}Initializing OpenWebmail... ${DEFAULT_COLOR}" 				&&
$LOC/cgi-bin/openwebmail/openwebmail-tool.pl --init $MAIL_OPT 					&&
#cp $SCRIPT_DIRECTORY/fr $LOC/cgi-bin/openwebmail/etc/lang

mv "$LOC/htdocs/openwebmail/help/en/templates_and_data/version notes.txt" \
    $LOC/htdocs/openwebmail/help/en/templates_and_data/version_notes.txt

) > $C_FIFO 2>&1   && (

# apache/apache2 auto setup
if  spell_installed  "apache";  then
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

message "Editing auth_unix.pl"
sedit "s/\/etc\/master.passwd/\/etc\/shadow/"  $LOC/cgi-bin/openwebmail/auth_unix.pl
sedit "s/\/usr\/sbin\/pwd_mkdb/none/"  $LOC/cgi-bin/openwebmail/auth_unix.pl

# Tune OWM defaults to SMGL style
sedit "s/\/var\/mail/\/var\/spool\/mail/" $LOC/cgi-bin/openwebmail/etc/openwebmail.conf 
sedit "s/\/usr\/local\/www\/data\/openwebmail/$SLOC\/htdocs\/openwebmail/"  $LOC/cgi-bin/openwebmail/etc/openwebmail.conf 
sedit "s/\/usr\/local\/www\/cgi-bin\/openwebmail/$SLOC\/cgi-bin\/openwebmail/" $LOC/cgi-bin/openwebmail/etc/openwebmail.conf 

)
