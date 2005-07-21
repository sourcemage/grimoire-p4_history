create_account nagios                      &&
./configure $OPTS --sysconfdir=/etc/nagios \
	--prefix=/usr/nagios       \
	--datadir=/usr/share/www/nagios       \
	--sbindir=/usr/share/www/nagios/cgi-bin   \
	--with-nagios-user=nagios             \
	--with-nagios-group=nagios            \
	--with-htmlurl=$HTML_URL              \
	--with-cgiurl=$CGI_URL                &&
make all                                   &&
cd contrib                                 &&
gcc convertcfg.c -o convertcfg             &&
cd $BUILD_DIRECTORY/nagios-plugins-1.4     &&
./configure $OPTS --sysconfdir=/etc/nagios \
	--prefix=/usr/nagios       \
	--with-nagios-user=nagios             \
	--with-nagios-group=nagios            \
	--with-cgiurl=$CGI_URL                &&
make                                       &&
cd $SOURCE_DIRECTORY
