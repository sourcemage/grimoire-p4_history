#!/bin/sh
HOST=`hostname`

echo -n "# "
ROOTDN=`gawk '/^rootdn\W+/ {print $2}' /etc/openldap/slapd.conf`
echo

cat << __EOF__
# Apply this LDIF by piping it into command:
# ldapmodify -D $ROOTDN -W
#

__EOF__
ldapsearch "(uid=*)" | gawk '/dn:\W+/ {
	match($0, /dn:\W+\w+=([^,]+).*/, a);
	print $0;
	print "changetype: modify"
	print "add: mail"
	print "objectclass: hordePrefs";
	print "objectclass: impPrefs";
	print "mail: " a[1] "@'$HOST'";
	print "";
}'
