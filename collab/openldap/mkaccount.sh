#!/bin/sh
# $Id: mkaccount.sh,v 1.4 2002/07/15 05:06:13 sergeyli Exp $

if [ "$UID" != 0 ]; then
	su - -c "$PWD/$0 $*"
	exit
fi

echo "#"
echo "# Usage: $0 <login> <id> <password>"

echo "# `grep $1 /etc/passwd`"

SUFFIX=`gawk '/^suffix\W+/ { match($0, /suffix\W+"?([^"]*)"?/, a); print a[1]; nextfile; }' /etc/openldap/slapd.conf`

# echo
if [ -z "$SUFFIX" ]; then
	HOST=`hostname`
	SUFFIX="o=${HOST#*.}"
fi

ID=${2:-1001}

cat << __EOF__
dn:           cn=$1,ou=Groups,$SUFFIX
objectClass:  top
objectClass:  posixGroup
cn:           $1
userPassword: {CRYPT}x
gidNumber:    $ID
memberuid:    $1

dn:               cn=$1,ou=Users,$SUFFIX
objectClass:      top
objectClass:      account
objectClass:      posixAccount
objectClass:      shadowAccount
cn:               $1
uid:              $1
userPassword:     `slappasswd -s "$3"`
shadowLastChange: 11763
shadowMax:        99999
shadowWarning:    7
loginShell:       /bin/sh
uidNumber:        $ID
gidNumber:        $ID
homeDirectory:    /home/$1
__EOF__
