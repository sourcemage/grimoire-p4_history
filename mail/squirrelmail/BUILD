(

# apache htdoc path auto detection
if  spell_installed    "apache";   then 
  LOC="/usr/share/httpd/htdocs/squirrelmail" 
elif  spell_installed  "apache-mod_ssl";  then 
  LOC="/usr/share/httpsd/htdocs/squirrelmail" 
elif  spell_installed  "apache2";  then 
  LOC="/usr/share/apache2/htdocs/squirrelmail" 
fi


rm -fr $LOC/doc 
rm -fr /usr/doc/squirrelmail/*

prepare_install

mkdir -p $LOC 
cp    -a $SPELL-$VERSION/* $LOC
chown -R www-data  $LOC
chgrp -R www-data  $LOC
chown -R www-data  $LOC/*
chgrp -R www-data  $LOC/*

# move the doc dir to /usr/doc
mkdir /usr/doc/squirrelmail 1>/dev/null 2>&1
mv $LOC/doc/* /usr/doc/squirrelmail/

rm -r -f $LOC/doc
ln -s /usr/doc/squirrelmail/ $LOC/doc

chown nobody.nogroup $LOC/doc
chmod 555 $LOC/doc

mv $LOC/AUTHORS      /usr/doc/squirrelmail
mv $LOC/COPYING      /usr/doc/squirrelmail
mv $LOC/INSTALL      /usr/doc/squirrelmail
mv $LOC/README       /usr/doc/squirrelmail
mv $LOC/ChangeLog    /usr/doc/squirrelmail
mv $LOC/ReleaseNotes /usr/doc/squirrelmail/Release-Notes
mv $LOC/UPGRADE      /usr/doc/squirrelmail

# This gives you a clue about why squirrelmail shows php code in the browser instead of the login page...
echo "#Add php4 extention support..." > $LOC/doc/httpd-sample-squirrelmail.conf
echo "<IfModule mod_php4.c>"         >> $LOC/doc/httpd-sample-squirrelmail.conf
echo "AddType application/x-httpd-php .phtml .php .php4 .php3" >> $LOC/doc/httpd-sample-squirrelmail.conf
echo "</IfModule mod_php4.c>"        >> $LOC/doc/httpd-sample-squirrelmail.conf

chown nobody.nogroup $LOC/doc/httpd-sample-squirrelmail.conf

if [ "$ORDER" == "y" ]; then
  cd $LOC
  patch  -p0  <  ${SCRIPT_DIRECTORY}/addressbook.diff
fi


) > $C_FIFO 2>&1
