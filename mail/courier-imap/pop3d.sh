#! /bin/sh
# $Id: pop3d.sh,v 1.1.1.1 2002/03/20 17:03:32 erics Exp $
#
# Copyright 1998 - 2000 Double Precision, Inc.
# See COPYING for distribution information.


prefix=/usr
exec_prefix=/usr
bindir=${exec_prefix}/bin
libexecdir=/usr/libexec

. /etc/courier-imap/pop3d-ssl
. /etc/courier-imap/pop3d

case $1 in
start)
	LIBAUTHMODULES=""
	for f in `echo $AUTHMODULES`
	do
		LIBAUTHMODULES="$LIBAUTHMODULES /usr/libexec/authlib/$f"
	done

	if test -x ${libexecdir}/authlib/authdaemond
	then
		/usr/bin/env - ${libexecdir}/authlib/authdaemond start
	fi

	/usr/bin/env - /bin/sh -c " . /etc/courier-imap/pop3d ; \
				. /etc/courier-imap/pop3d-ssl ; \
		POP3_STARTTLS=$POP3DSTARTTLS ; export POP3_STARTTLS ; \
		TLS_PROTOCOL=$TLS_STARTTLS_PROTOCOL ; \
		`sed -n '/^#/d;/=/p' </etc/courier-imap/pop3d | \
			sed 's/=.*//;s/^/export /;s/$/;/'`
		`sed -n '/^#/d;/=/p' </etc/courier-imap/pop3d-ssl | \
			sed 's/=.*//;s/^/export /;s/$/;/'`
		/usr/libexec/couriertcpd -address=$ADDRESS \
			-stderrlogger=/usr/libexec/logger \
			-stderrloggername=pop3d \
			-maxprocs=$MAXDAEMONS -maxperip=$MAXPERIP \
			-pid=$PIDFILE $TCPDOPTS \
			$PORT ${exec_prefix}/sbin/pop3login $LIBAUTHMODULES \
				${exec_prefix}/bin/pop3d Maildir"
	;;
stop)
	/usr/libexec/couriertcpd -pid=$PIDFILE -stop
	if test -x ${libexecdir}/authlib/authdaemond
	then
		${libexecdir}/authlib/authdaemond stop
	fi
	;;
esac
exit 0
