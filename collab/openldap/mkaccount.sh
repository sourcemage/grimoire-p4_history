# $Id: mkaccount.sh,v 1.2 2002/06/03 03:42:23 sergeyli Exp $
#!/bin/sh
echo -n "# "
SUFFIX=`gawk '/^suffix\W+/ { match($2, /"?([^"]*)"?/, a); print a[1]; nextfile; }' /etc/openldap/slapd.conf`
echo
if [ -z "$SUFFIX" ]; then
	HOST=`hostname`
	SUFFIX="o=${HOST#*.}"
fi

cat << __EOF__
dn: cn=$1,ou=Groups,$SUFFIX
objectClass: top
objectClass: posixGroup
cn: $1
userPassword: {CRYPT}x
gidNumber: $2
memberuid: $1

dn: cn=$1,ou=Users,$SUFFIX
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
cn: $1
uid: $1
userPassword: `slappasswd -s "$3"`
shadowLastChange: 11763
shadowMax: 99999
shadowWarning: 7
loginShell: /bin/sh
uidNumber: $2
gidNumber: $2
homeDirectory: /home/$1
__EOF__
