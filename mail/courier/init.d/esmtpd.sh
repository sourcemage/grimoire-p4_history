#! /bin/sh
#
#  $Id: esmtpd.in,v 1.15 2001/08/05 20:34:11 mrsam Exp $
#
#  Copyright 1998 - 2000 Double Precision, Inc.  See COPYING for
#  distribution information.
#
#  This is a simple script to start/stop the smtp port daemon, courieresmtpd.
#
#  Argument "start" starts the daemon.
#  Argument "stop" stops the daemon (just the listening daemon).
#  Argument "restart" rereads the smtpaccess.dat file.

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

prefix="/usr"
exec_prefix="/usr"
sysconfdir="/etc/courier"
sbindir="/usr/sbin"

cd  ${prefix}  ||  exit  1

case  `basename  $0`  in
		esmtpd.sh)
				configfiles="${sysconfdir}/esmtpd"
				.  ${sysconfdir}/esmtpd
				;;

	esmtpd-msa.sh)
				configfiles="${sysconfdir}/esmtpd ${sysconfdir}/esmtpd-msa"
				.  ${sysconfdir}/esmtpd
				.  ${sysconfdir}/esmtpd-msa
				;;

			 *)
				echo  "Usage: esmtpd | esmtpd-msa <start | stop | restart>"  >&2
				exit  1
				;;
esac

case  $1  in
	  start)
			if  test  "${ACCESSFILE}"  !=  "";  then
				if  test  !  -f  "$ACCESSFILE.dat";  then
					ACCESSFILE=""
				else
					ACCESSFILE="-access=${ACCESSFILE}.dat"
				fi
			fi
			if  test  "$ADDRESS"  !=  "";  then
				ADDRESS="-address=$ADDRESS"
			fi
			TCPDOPTS="$TCPDOPTS        \
				-user=$MAILUSER        \
				-group=$MAILGROUP      \
				$ADDRESS               \
				$BLACKLISTS            \
				$ACCESSFILE            \
				-maxprocs=$MAXDAEMONS  \
				-maxperc=$MAXPERC      \
				-maxperip=$MAXPERIP    \
				-pid=$PIDFILE"
			if  test  "$AUTHMODULES"  !=  "";  then
				authstart="${exec_prefix}/libexec/courier/modules/esmtp/authstart"
				if  test  -x  "$authstart";  then
					AUTHMODULES="$authstart  $AUTHMODULES"
				else
					# not installed/disabled
					ESMTPAUTH=""
					AUTHMODULES=""
				fi
			fi

			(
				echo  prefix=${prefix}
				echo  exec_prefix=${exec_prefix}
				echo  sysconfdir=${sysconfdir}
				echo  sbindir=${sbindir}
				echo  set  -a
				for  f  in  $configfiles;  do
					echo  .  $f
				done
				echo  "ulimit  -d  $ULIMIT"
				echo  ${sbindir}/couriertcpd  $TCPDOPTS $PORT                               \
					${sbindir}/courieresmtpd  $AUTHMODULES  '>/dev/null  2>&1  </dev/null'
			)  |  /usr/bin/env  -  /bin/sh
			exit  0
			;;

	   stop)
			${sbindir}/couriertcpd  -pid=$PIDFILE  -stop
			exit  0
			;;

	restart)
			${sbindir}/couriertcpd  -pid=$PIDFILE  -restart
			exit  0
			;;

		  *)
			echo  "Usage: esmtpd | esmtpd-msa (start | stop | restart)"
			exit  1
			;;
esac
