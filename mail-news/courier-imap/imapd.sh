#! /bin/sh
# $Id: imapd.sh,v 1.1.1.1 2002/03/20 17:03:32 erics Exp $
#
# Copyright 1998 - 2000 Double Precision, Inc.
# See COPYING for distribution information.


prefix=/usr
exec_prefix=/usr
bindir=${exec_prefix}/bin
libexecdir=/usr/libexec

. /etc/courier-imap/imapd-ssl
. /etc/courier-imap/imapd

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

	ulimit -d $IMAP_ULIMITD
	/usr/bin/env - /bin/sh -c " . /etc/courier-imap/imapd ; \
				. /etc/courier-imap/imapd-ssl ; \
		IMAP_STARTTLS=$IMAPDSTARTTLS ; export IMAP_STARTTLS ; \
		TLS_PROTOCOL=$TLS_STARTTLS_PROTOCOL ; \
		`sed -n '/^#/d;/=/p' </etc/courier-imap/imapd | \
			sed 's/=.*//;s/^/export /;s/$/;/'`
		`sed -n '/^#/d;/=/p' </etc/courier-imap/imapd-ssl | \
			sed 's/=.*//;s/^/export /;s/$/;/'`
		/usr/libexec/couriertcpd -address=$ADDRESS \
			-stderrlogger=/usr/libexec/logger \
			-stderrloggername=imapd \
			-maxprocs=$MAXDAEMONS -maxperip=$MAXPERIP \
			-pid=$PIDFILE $TCPDOPTS \
			$PORT ${exec_prefix}/sbin/imaplogin $LIBAUTHMODULES \
				${exec_prefix}/bin/imapd Maildir"
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
