#! /bin/sh
# $Id: imapd.rc.in,v 1.16 2002/12/24 02:35:50 mrsam Exp $
#
# Copyright 1998 - 1999 Double Precision, Inc.
# See COPYING for distribution information.

###########################################
##                                       ##
##  Source Mage GNU/Linux modifications  ##
##                                       ##
# SMGL-script-version=20030421
# SMGL-START:3 4 5:S90
# SMGL-STOP:0 1 2 6:K10
##                                       ##
source /etc/init.d/functions
##                                       ##
##  Source Mage GNU/Linux modifications  ##
##                                       ##
##  Plus, also, general code cleanup     ##
##                                       ##
###########################################

prefix=/usr
exec_prefix=/usr
sbindir=${exec_prefix}/sbin

.  /etc/courier/imapd-ssl
.  /etc/courier/imapd

case  $1  in
	  start)
			LIBAUTHMODULES=""
			for  f  in  `echo  $AUTHMODULES`;  do
				LIBAUTHMODULES="$LIBAUTHMODULES  ${exec_prefix}/libexec/authlib/$f"
			done
			ulimit  -v  $IMAP_ULIMITD
			/usr/bin/env  -  /bin/sh  -c  "  set  -a;                \
				prefix=/usr;                                         \
				exec_prefix=/usr;                                    \
				sbindir=${exec_prefix}/sbin;                         \
				bindir=/usr/bin;                                     \
				.  /etc/courier/imapd;                               \
				.  /etc/courier/imapd-ssl;                           \
				IMAP_STARTTLS=$IMAPDSTARTTLS;                        \
				export  IMAP_STARTTLS;                               \
				TLS_PROTOCOL=$TLS_STARTTLS_PROTOCOL;                 \
				${exec_prefix}/sbin/couriertcpd                      \
					-address=$ADDRESS                                \
					-stderrlogger=${exec_prefix}/sbin/courierlogger  \
					-stderrloggername=imapd                          \
					-maxprocs=$MAXDAEMONS                            \
					-maxperip=$MAXPERIP                              \
					-pid=$PIDFILE                                    \
					$TCPDOPTS                                        \
					$PORT                                            \
				${exec_prefix}/libexec/courier/imaplogin             \
					$LIBAUTHMODULES                                  \
				/usr/bin/imapd                                       \
					Maildir"
			exit  0
			;;

	   stop)
			${exec_prefix}/sbin/couriertcpd  -pid=$PIDFILE  -stop
			exit  0
			;;

	restart)
			${exec_prefix}/sbin/couriertcpd  -pid=$PIDFILE  -restart
			exit  0
			;;

		  *)
			echo  "Usage: $0 (start | stop | restart)"
			exit  1
			;;
esac
