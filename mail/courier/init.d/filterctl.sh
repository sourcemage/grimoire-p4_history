#! /bin/sh
#
# Copyright 1998 - 2000 Double Precision, Inc.
# See COPYING for distribution information.
#
# $Id: filterctl.in,v 1.3 2000/08/08 03:01:28 mrsam Exp $

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
libexecdir="/usr/libexec/courier"
sysconfdir="/etc/courier"
localstatedir="/var"

filterbindir="${libexecdir}/filters"
filteractivedir="${sysconfdir}/filters/active"
pidfile="${localstatedir}/tmp/courierfilter.pid"

cmd="$1"
filter="$2"

case  "$cmd"  in
	start)
			if  test  "$filter"  =  "";  then
				echo  "Usage: $0 (start | stop) filter"  >&2
				exit  1
			fi
			;;

	 stop)
			if  test  "$filter"  =  "";  then
				echo  "Usage: $0 (start | stop) filter"  >&2
				exit  1
			fi
			;;

		*)
			echo  "Usage: $0 (start | stop) filter"  >&2
			exit  1
			;;
esac

case "$filter" in
	*/*)
		echo  "This filter is not installed in $filterbindir\n"  >&2
		exit  1
#		filter=""
		;;
	  *)
		if  test  !  -x  $filterbindir/$filter;  then
			echo  "This filter is not installed in $filterbindir\n"  >&2
#			filter=""
		fi
		exit  1
		;;
esac

#if  test  "$filter"  =  "";  then
#	echo  "This filter is not installed in $filterbindir\n"  >&2
#	exit  1
#fi

case "$cmd" in
	start)
			test  !  -x  $filterbindir/$filter                               \
				||  ln  -s  $filterbindir/$filter  $filteractivedir/$filter  \
				||  exit  1
			test  -f  "$pidfile"  &&  kill  -HUP  "`cat  $pidfile`"  2>/dev/null
			exit  0
			;;

	 stop)
			rm  -f  $filteractivedir/$filter
				||  exit  1
			test  -f  "$pidfile"  &&  kill  -HUP  "`cat  $pidfile`"  2>/dev/null
			exit  0
			;;
esac

#test  -f  "$pidfile"  &&  kill  -HUP  "`cat  $pidfile`"  2>/dev/null
#exit  0
