#! /bin/sh
# $Id: imapd-ssl.rc.in,v 1.13 2002/12/24 02:35:50 mrsam Exp $
#
# Copyright 1998 - 2000 Double Precision, Inc.
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
bindir=/usr/bin

.  /etc/courier/imapd
.  /etc/courier/imapd-ssl

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
				IMAP_TLS=1;                                          \
				export  IMAP_TLS;                                    \
				${exec_prefix}/sbin/couriertcpd                      \
					-address=$SSLADDRESS                             \
					-stderrlogger=${exec_prefix}/sbin/courierlogger  \
					-stderrloggername=imapd-ssl                      \
					-maxprocs=$MAXDAEMONS                            \
					-maxperip=$MAXPERIP                              \
					-pid=$SSLPIDFILE                                 \
					$TCPDOPTS                                        \
					$SSLPORT                                         \
					$COURIERTLS                                      \
					-server                                          \
					-tcpd                                            \
				${exec_prefix}/libexec/courier/imaplogin             \
					$LIBAUTHMODULES                                  \
				/usr/bin/imapd                                       \
					Maildir"
			exit  0
			;;

	   stop)
			${exec_prefix}/sbin/couriertcpd  -pid=$SSLPIDFILE  -stop
			exit  0
			;;

	restart)
			${exec_prefix}/sbin/couriertcpd  -pid=$SSLPIDFILE  -restart
#			$0  stop
#			sleep  2
#			$0  start
			exit  0
			;;

		  *)
			echo  "Usage: $0 (start | stop | restart)"
			exit  1
			;;
esac
